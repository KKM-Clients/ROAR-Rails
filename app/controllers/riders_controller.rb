class RidersController < ApplicationController
  def index
  end

  def new
    @rider = Rider.new
    3.times { @rider.passengers.build }
  end

  def create
    @rider = Rider.create(rider_params)

    if @rider.save

      rid = Rider.last[:id]

      flash[:success] = "You have successfully created a new Rider!"

      count = Passenger.where(:rider_id => rid).where(:age => "+10").count

      Rider.update(rid, :pass => count)

      redirect_to :controller => 'square', :action => 'index'
    else
      render :new
    end
  end

  def update
    rid = Rider.last[:id]




    #@rider.update
  end

  def rider_params
    params.require(:rider).permit(:RRCW, :DFN, :DLN, :DMA, :DC, :DS, :DZ, :DCP, :DEA, :ECFN, :ECLN,
    :ECCP, :ECT, :ExpLev, :RD, :FLH, :FLT, :SLH, :SLT, :DTS, :PT, passengers_attributes: [:fname, :lname, :age, :tshirt])
  end
end
