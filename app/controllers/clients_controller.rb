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

    if client.save
      redirect_to root_url, notice: "Thanks for signing up!"
    else
      redirect_to root_url, notice: "Sign up Failed. All fields must be filled in."
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