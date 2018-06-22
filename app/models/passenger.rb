class Passenger < ApplicationRecord
  belongs_to :rider, optional: true

end
