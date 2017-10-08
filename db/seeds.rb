require 'csv'
require './app/models/station'

class Seed

  OPTIONS = {headers: true, header_converters: :symbol}

  def self.start
    seed_stations
    # seed_trips
    # seed_conditions
  end

  def self.seed_stations
    CSV.foreach("./db/csv/station.csv", OPTIONS) do |row|
      row[:installation_date] = Date.strptime(row[:installation_date], "%m/%d/%Y")
      Station.create!(row.to_hash)
    end
  end

#   def self.seed_trips
#     CSV.foreach("./db/csv/trip.csv", OPTIONS) do |row|
#
#       Trip.create!(row.to_hash)
#     end
#   end
end

Seed.start