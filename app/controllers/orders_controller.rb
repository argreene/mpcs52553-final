class OrdersController < ApplicationController

  def new

    @provider = Provider.find_by(id: params["id"])
    @client =  Client.find_by(id: params["client"])

    sps = SPS.where(provider_id: @provider.id)
    serv_ids = sps.pluck(:service_id)
    @services = Service.where(id: serv_ids)

  end

  def create

    @provider = Provider.find_by(id: params["provider_id"])
    @client =  Client.find_by(id: params["client_id"])

    if @client.present? && @client.id == session["user_id"]
      o = Orders.new
      o.provider_id = @provider.id
      o.client_id = @client.id
      o.service_id = params["service_id"]
      o.amount = params["amount"]
      o.created_at = Time.now
      o.save
      redirect_to "/providers/#{@provider.id}", notice: "Order placed!"
    else
      redirect_to "/providers/#{@provider.id}", notice: "Client not authorized or signed in"
    end

  end

  def index
  end

  def show
    @client = Client.find_by(id: params["id"])

    if @client.present? && @client.id == session["user_id"]
      @orders = @client.orders
    else
      redirect_to root_url, notice: "Nice try!"
    end
  end


end