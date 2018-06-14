class SquareController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  def index
    #@rider_id = params[:id]

    pass = params[:num_pass].to_i
    lunch = params[:num_lunches].to_i

    @total_riders = pass + 1      #total number of riders above 10 pluse driver
    @trc = @total_riders * 70     #total rider cost
    @total_lunch = lunch          #total number of lunches
    @tlc = @total_lunch * 8       #total lunch cost
    @Grandtotal = @trc + @tlc     #Grand total of rider + lunches

    #random = SecureRandom.urlsafe_base64

    #@order = {"number of riders:" => @total_riders , "cost" => @trc}

    #respond_with(@order)
  end

  def create
    render :new

  end


end
