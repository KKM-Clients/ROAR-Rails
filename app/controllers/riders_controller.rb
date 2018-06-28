class RidersController < ApplicationController
  def index
      @date = Date.today.to_s

      @closed = "2018-008-06"
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

      #count = Passenger.where(:rider_id => rid).where(:age => "+10").count

      #Rider.update(rid, :pass => count)

      redirect_to :controller => 'square', :action => 'new'
    else
      render :new
    end
  end

  def update
  end

  def show
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

  def rider_params
    params.require(:rider).permit(:RRCW, :DFN, :DLN, :DMA, :DC, :DS, :DZ, :DCP, :DEA, :ECFN, :ECLN,
    :ECCP, :ECT, :ExpLev, :RD, :FLH, :FLT, :SLH, :SLT, :DTS, :PT, passengers_attributes: [:fname, :lname, :age, :tshirt])
  end
end
