class Api::V1::DisruptionsController < ApplicationController

  # GET /api/v1/disruptions.json
  def index
    disruptions = TrafficDisruption.active
    render json: disruptions
  end

end
