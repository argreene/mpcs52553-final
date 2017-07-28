class ResultsController < ApplicationController

  def index
    search = params["search"]
    @providers = Provider.where("provider_name like :search OR provider_contact like :search OR
                 provider_address like :search OR description like :search", search: "%#{search}%")
  end

  def show

  end

  def new
  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end
end