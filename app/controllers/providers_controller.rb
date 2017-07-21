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
    p.provider_contact = params["provider_contact"]
    p.provider_name = params["provider_name"]
    p.provider_address = params["provider_address"]
    p.rate = params["rate"].to_f
    p.save

    redirect_to "/provider", notice: 'New provider successfuly registered.'
  end

  def edit
    @provider= Provider.find_by(id: params["id"])
  end

  def update
    p = Provider.find_by(id: params["id"])
    p.provider_contact = params["provider_contact"]
    p.provider_name = params["provider_name"]
    p.provider_address = params["provider_address"]
    p.rate = params["rate"].to_f * 100
    p.save

    redirect_to "/provider/#{p.id}", notice: 'Provider successfully updated.'
  end

  def destroy
    @provider = Provider.find_by(id: params["id"])
    @provider.delete
    redirect_to "/provider",  notice: 'Provider has been removed'
  end
end