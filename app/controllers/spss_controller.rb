class SpssController < ApplicationController

  def create
    sps = SPS.new
    sps.provider_id = params['provider_id']
    sps.service_id = params['service_id']
    sps.save
    redirect_to "/providers/#{sps.provider_id}", notice: "Services updated"
  end

end