class Park
  attr_reader :name, :description, :directions_url, :directions, :hours, :id

  def initialize(data)
    @id = data[:id]
    @name = data[:fullName]
    @description = data[:description]
    @directions_url = data[:directionsUrl]
    @directions = data[:directionsInfo]
    @hours = data[:operatingHours].first[:standardHours]
  end
end