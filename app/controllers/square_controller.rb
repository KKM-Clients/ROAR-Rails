class SquareController < ApplicationController
  #before_action :set_order, only: [:show, :edit, :update, :destroy]
  #respond_to :html, :json


  def index
    @rider = Rider.last
    @email = @rider.DEA
    @zipcode = @rider.DZ
    #random = SecureRandom.urlsafe_base64
    pass = @rider.pass.to_i + 1

    flh = @rider.FLH.to_i
    flt = @rider.FLT.to_i
    slh = @rider.SLH.to_i
    slt = @rider.SLT.to_i

    lunch = flh + flt + slh + slt

    @total_riders = pass          #total number of riders above 10 pluse driver
    @trc = @total_riders * 70     #total rider cost
    @total_lunch = lunch          #total number of lunches
    @tlc = @total_lunch * 8       #total lunch cost
    @Grandtotal = @trc + @tlc     #Grand total of rider + lunches


    #@order = {"number of riders:" => @total_riders , "cost" => @trc}

    #respond_with(@order)
  end

  def create
    @rider = Rider.last

    #Set variables
    nonce = params[:nonce]
    amount = params[:sq_total].to_i * 100
    location_id = ENV["SQUARE_LOCATION_ID"]

    if !nonce.empty?

      transactions_api = SquareConnect::TransactionsApi.new

      request_body = {
        :card_nonce => nonce,

        # Monetary amounts are specified in the smallest unit of the applicable currency.
        # This amount is in cents. It's also hard-coded for $1, which is not very useful.
        :amount_money => {
          :amount => amount,
          :currency => 'USD'
        },

        # Every payment you process for a given business have a unique idempotency key.
        # If you're unsure whether a particular payment succeeded, you can reattempt
        # it with the same idempotency key without worrying about double charging
        # the buyer.
        :idempotency_key => SecureRandom.uuid,

        :buyer_email_address => @rider.DEA,

        :billing_address => {
          :address_line_1 => @rider.DMA,
          :locality => @rider.DC,
          :administrative_district_level_1 => @rider.DS,
          :postal_code => @rider.DZ
        }

      }

      # The SDK throws an exception if a Connect endpoint responds with anything besides 200 (success).
      # This block catches any exceptions that occur from the request.
      begin
        resp = transactions_api.charge(location_id, request_body)
      rescue SquareConnect::ApiError => e
        raise "Error encountered while charging card: #{e.message}"
      end

      #puts resp

      @resp = resp



      # Send receipt email to user
      #ReceiptMailer.charge_email(params[:email],data).deliver_now if Rails.env == "development"

      render :show
      #render json: {:status => 200}
    else
      flash[:notice] = "Invalied CC please resubmit."

      render :new
    end
  end

  def show
    @rid = Rider.last
    @rid = @rider.DEA
    
  end
end
