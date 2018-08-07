class GalleryController < ApplicationController

  def index
  end

  def new
    @page = page

    if @page == "seaplane"
      @event_year = "2017"
    elsif @page == "rally colorado"
      @event_year = "2018"
    elsif @page == "roar"
      @event_year = "2017"
    elsif @page == "canyon pintado hillclimb"
      @event_year = "2017"
    end

    @images = Dir.chdir(Rails.root.join('app/assets/images')) do
      Dir.glob("Gallery/2017/#{@page}/*.jpg")
    end

    render :show
  end

  def show
  end

  private
  def page
    @page = params[:page]
  end
end
