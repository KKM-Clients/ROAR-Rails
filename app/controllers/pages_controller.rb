class PagesController < ApplicationController


  def adacompliance
    render
  end

  def seaplane
    @images = Dir.chdir(Rails.root.join('app/assets/images')) do
      Dir.glob("Gallery/2017/seaplane/*.jpg")
    end

    render
  end
  def rally
    @images = Dir.chdir(Rails.root.join('app/assets/images')) do
      Dir.glob("Gallery/2017/rally/*.jpg")
    end

    render
  end
  def roar
    @images = Dir.chdir(Rails.root.join('app/assets/images')) do
      Dir.glob("Gallery/2017/roar/*.jpg")
    end

    render
  end
  def hillclimb
    @images = Dir.chdir(Rails.root.join('app/assets/images')) do
      Dir.glob("Gallery/2017/hillclimb/*.jpg")
    end

    render
  end
end
