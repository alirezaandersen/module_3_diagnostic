class Station


  def self.service
    NrelService.new
  end

  def self.find_by(zipcode)
    data = service.nearest_energy_fuel_station({
      :location => zipcode,
      :radius => "6.0",
      :fuel_type => "ELEC,LPG",
      :limit => "10"
      })
      data[:fuel_stations].map do |station|
      new(station)
      # binding.pry
      end
    end



  end
