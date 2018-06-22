class SquareController < ApplicationController
  #before_action :set_order, only: [:show, :edit, :update, :destroy]
  #respond_to :html, :json

  def index
    #@rider_id = params[:id]
    #random = SecureRandom.urlsafe_base64

    pass = params[:num_pass].to_i
    lunch = params[:num_lunches].to_i

    @total_riders = pass      #total number of riders above 10 pluse driver
    @trc = @total_riders * 70     #total rider cost
    @total_lunch = lunch          #total number of lunches
    @tlc = @total_lunch * 8       #total lunch cost
    @Grandtotal = @trc + @tlc     #Grand total of rider + lunches



    #@order = {"number of riders:" => @total_riders , "cost" => @trc}

    #respond_with(@order)
  end

  def create

    #Set variables
    nonce = params[:nonce]
    amount = params[:sq_total].to_i * 100

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
        :idempotency_key => SecureRandom.uuid
      }

      location_id = ENV["SQUARE_LOCATION_ID"]

      # The SDK throws an exception if a Connect endpoint responds with anything besides 200 (success).
      # This block catches any exceptions that occur from the request.
      begin
        resp = transactions_api.charge(location_id, request_body)
      rescue SquareConnect::ApiError => e
        raise "Error encountered while charging card: #{e.message}"
      end

      puts resp


      # Send receipt email to user
      ReceiptMailer.charge_email(params[:email],data).deliver_now if Rails.env == "development"

      render json: {:status => 200}
    else
      flash[:notice] = "Invalied CC please resubmit."

      render :index
    end

    render :show
  end

  def show

  end
end
