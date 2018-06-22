class RidersController < ApplicationController
  def index
  end

  def new
    @rider = Rider.new
  end

  def create
    @rider = Rider.new(rider_params)

    if @rider.save
      flash[:success] = "You have successfully created a new Rider!"

      redirect_to :controller => 'square', :action => 'index'
    else
      render :new
    end
  end

  def show

  end

  def rider_params
    params.require(:rider).permit(:RRCW, :DFN, :DLN, :DMA, :DC, :DS, :DZ, :DCP, :DEA, :ECFN, :ECLN, :ECCP, :ECT, :ExpLev, :RD, :FLH, :FLT, :SLH, :SLT, :DTS, :PT)
  end
end
