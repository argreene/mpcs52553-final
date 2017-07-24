class ClientsController < ApplicationController

  def new
  end

  def create
    client = Client.new
    client.client_name = params['name']
    client.client_contact = params['email']
    client.client_address = params['address']
    client.password = params['password']
    client.save
    redirect_to clients_url, notice: "Thanks for signing up!"
  end

  def index
  end

  def show
    @client = Client.find_by(id: params["id"])

    if @client.present? && @client.id == session["client_id"]
      @orders = @client.orders
    else
      redirect_to root_url, notice: "Nice try!"
    end
  end


end