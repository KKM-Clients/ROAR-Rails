class RidersController < ApplicationController
  def index
  end

  def new
    @rider = Rider.new
  end

  def create
    @rider = current_driver.riders.build(rider_params)

    if @rider.save
      flash[:success] = "You have successfully created a new Rider!"
      
      pass = @rider.pass.to_i + 1

      flh = @rider.FLH.to_i
      flt = @rider.FLT.to_i
      slh = @rider.SLH.to_i
      slt = @rider.SLT.to_i

      lunch = flh + flt + slh + slt

      redirect_to :controller => 'square', :action => 'index', id: @rider.id, num_pass: pass, num_lunches: lunch
      #redirect_to @rider
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
