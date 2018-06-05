class RidersController < ApplicationController
  def index
    #@riders = Rider.all
    #@rider = Rider.new
  end

  def new
    @rider = Rider.new
  end

  def create
    @rider = Rider.new(rider_params)

    if @rider.save
      flash[:success] = "You have successfully created a new Rider!"

      #redirect_to :controller => 'squarecheckout', :action => 'index'
      redirect_to @rider
    else
      render :new
    end
  end

  def show
    @rider = Rider.last

    #if @rider.pass.cell.blank?
    #  pass = 0
    #else
    #  pass = @rider.pass
    #end

    @total_riders = 1
    @trc = @total_riders  * 70

    flh = @rider.FLH.to_i
    flt = @rider.FLT.to_i
    slh = @rider.SLH.to_i
    slt = @rider.SLT.to_i

    @total_lunch = flh + flt + slh + slt
    @total_ham = flh + slh
    @total_turkey = flt + slt

    @tlc = @total_lunch * 8

    @Grandtotal = @trc + @tlc

  end

  def rider_params
    params.require(:rider).permit(:RRCW, :DFN, :DLN, :DMA, :DC, :DS, :DZ, :DCP, :DEA, :ECFN, :ECLN, :ECCP, :ECT, :ExpLev, :RD, :FLH, :FLT, :SLH, :SLT, :DTS, :PT)
  end
end
