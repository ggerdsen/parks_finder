class ParksController < ApplicationController
  def index
    @state = params[:state]
    conn = Faraday.new(url: "https://developer.nps.gov") do |faraday|
      faraday.params["api_key"] = ENV["PARKS_API_KEY"]
    end
    response = conn.get("/api/v1/parks?stateCode=#{@state}")
    parsed = JSON.parse(response.body, symbolize_names: true)
    @selected_parks = looper(parsed)
    @total_parks = parsed[:data].count
  end
  
  def looper(parsed)
    parsed[:data].map do |data|
      Park.new(data)
    end
  end
end