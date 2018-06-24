class Rider < ApplicationRecord
  has_many :passengers, dependent: :destroy

  accepts_nested_attributes_for :passengers, allow_destroy: true, reject_if: lambda {|attributes| attributes['fname'].blank?}

end
  
