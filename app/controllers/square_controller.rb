class SquareController < ApplicationController
  #before_action :set_order, only: [:show, :edit, :update, :destroy]
  #respond_to :html, :json

  def index
    @rider = Rider.last

    #number of riders
    @pass_free = Passenger.where(:rider_id => @rider.id).where(:age => 0).count   #number of riders uner 10
    @pass_pay =  Passenger.where(:rider_id =>   @rider.id).where(:age => 1).count+1  #number of riders over 10

    #raise $pass_free.inspect

    #total rider cost
    @trc = @pass_pay * 70     #total rider cost

    #Set up to calculate lunches
    flh = @rider.FLH
    flt = @rider.FLT
    slh = @rider.SLH
    slt = @rider.SLT

    #total of all lunches
    @lunch = flh + flt + slh + slt

    #raise @lunch.inspect


    #total over all
    @tlc = @lunch * 8             #total lunch cost
    @Grandtotal = @trc + @tlc           #Grand total of rider + lunches

  end

  def create
    @rider = Rider.last

    #Set variables
    nonce = params[:nonce]

    amount = params[:sq_total].to_i * 100

    if !nonce.empty?

      transactions_api = SquareConnect::TransactionsApi.new

      request_body = {
        # Every payment you process for a given business have a unique idempotency key.
        # If you're unsure whether a particular payment succeeded, you can reattempt
        # it with the same idempotency key without worrying about double charging
        # the buyer.
        :idempotency_key => SecureRandom.uuid,

        # Monetary amounts are specified in the smallest unit of the applicable currency.
        # This amount is in cents. It's also hard-coded for $1, which is not very useful.
        :amount_money => {
          :amount => amount,
          :currency => 'USD'
        },

        # A nonce generated from the `SqPaymentForm` that represents the card to charge.
        :card_nonce => nonce,

        #An optional ID you can associate with the transaction for your own purposes This value cannot exceed 40 characters.
        :reference_id => (@rider.id.to_s + @rider.DZ),

        :billing_address => {
          :address_line_1 =>@rider.DMA,
          :locality =>@rider.DC,
          :administrative_district_level_1 =>@rider.DS,
          :postal_code =>@rider.DZ
        },

        :buyer_email_address =>@rider.DEA

      }

      location_id = ENV["SQUARE_LOCATION_ID"]

      # The SDK throws an exception if a Connect endpoint responds with anything besides 200 (success).
      # This block catches any exceptions that occur from the request.
      begin
        resp = transactions_api.charge(location_id, request_body)
      rescue SquareConnect::ApiError => e
        raise "Error encountered while charging card: #{e.message}"
      end

      #@resp = resp

      @refid = resp.transaction.reference_id
      @amount = resp.transaction.tenders[0].amount_money.amount / 100

      #add add refid to db as Regid
      Rider.update(@rider.id, :regid => @refid)

      #raise @resp.inspect

      # Send receipt email to user
      #ReceiptMailer.charge_email(params[:email],data).deliver_now if Rails.env == "development"

      #render json: {:status => 200}

      redirect_to @rider
    else
      flash[:notice] = "Invalied CC please resubmit."

      render :new
    end
  end
end
