class ProvidersController < ApplicationController

  def index
    @providers = Provider.all
  end

  def show
    @provider = Provider.find_by(id: params["id"])
  end

  def new
  end

  def create
    p = Provider.new
    p.provider_contact = params["email"]
    p.provider_name = params["name"]
    p.provider_address = params["address"]
    p.rate = params["rate"].to_f
    p.description = params["description"]
    p.password = params['password']
    p.save

    redirect_to "/providers", notice: 'New provider successfuly registered.'
  end

  def edit
    @provider= Provider.find_by(id: params["id"])
  end

  def update
    p = Provider.find_by(id: params["id"])
    p.provider_contact = params["email"]
    p.provider_name = params["name"]
    p.provider_address = params["address"]
    p.rate = params["rate"].to_f
    p.description = params["description"]
    p.save

    sps = SPS.new
    sps.provider_id = params["id"]
    sps.service_id = params["service_id"]
    sps.save

    redirect_to "/providers/#{p.id}", notice: 'Provider successfully updated.'
  end

  def destroy
    @provider = Provider.find_by(id: params["id"])
    @provider.delete
    redirect_to "/providers",  notice: 'Provider has been removed'
  end
end