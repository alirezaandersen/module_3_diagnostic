class Station

  attr_reader :name, :access_times, :distance, :fuel_types, :city, :state, :street_address

  def initialize(data)
    @name = data[:station_name]
    @street_address = data[:street_address]
    @city = data[:city]
    @state = data[:state]
    @distance = data[:distance]
    @fuel_types = data[:fuel_type_code]
    @access_times = data[:access_days_time]
  end

  def self.service
    NrelService.new
  end

  def self.find_by(params)
    data = service.nearest_energy_fuel_station({
      :location => params["zip"],
      :radius => params["distance"],
      :fuel_type => "ELEC,LPG",
      :limit => "10" 
      })
      data[:fuel_stations].map do |station|
      new(station)
    end
  end

end
