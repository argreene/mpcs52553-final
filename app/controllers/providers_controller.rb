class ProvidersController < ApplicationController

  def index
    @providers = Provider.all
  end

  def show
    @provider = Provider.find_by(id: params["id"])
  end

  def new
    @email = params['e']
    @name = params['n']
    @address = params['a']
    @rate = params['r']
    @description =  params['d']

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

    if p.save
      redirect_to "/providers", notice: 'New provider successfuly registered.'
    else
      redirect_to "/providers/new?e=#{params['email']}&n=#{params['name']}&a=#{params['address']}&r=#{params['rate']}&d=#{params['description']}",
                  :notice => 'Registration Failed.  All fields must be filled in.'
    end

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

    if p.save
      redirect_to "/providers/#{p.id}", notice: 'Provider successfully updated.'
    else
      redirect_to "/providers/#{p.id}", notice: 'Update failed.  All fields must be filled in.'
    end


  end

  def destroy
    @provider = Provider.find_by(id: params["id"])
    @provider.delete
    reset_session
    redirect_to "/providers",  notice: 'Provider has been removed'
  end
end