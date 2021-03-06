class Passenger < ApplicationRecord
  has_many :trips, dependent: :destroy

  validates :name, presence: {message: "Passenger must have a name."}
  validates :phone_num, presence: {message: "Phone number is required."}

  def total_charged
    sum = 0
    trips.each do |trip|
      sum += trip.cost
    end
    return '%.2f'%(sum/100)
  end
end
