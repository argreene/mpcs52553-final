class SessionsController < ApplicationController

  def new
  end

  def create
    c = Client.find_by(client_contact: params["email"])

    if c != nil
      if c.authenticate(params["password"])
        # cookies["user_id"] = u.id
        session["user_id"] = c.id
        redirect_to "/", notice: "Welcome back, #{c.client_name}!"
      else
        redirect_to "/sessions/new", alert: "Bad password"
      end
    else
      p = Provider.find_by(provider_contact: params["email"])
      if p != nil
        if p.authenticate(params["password"])
          session["user_id"] = p.id
          redirect_to "/", notice: "Welcome back, #{p.provider_name}!"
        else
          redirect_to "/sessions/new", alert: "Bad password"
        end
      else
        redirect_to "/sessions/new", alert: "Unknown user"
      end
    end

  end

  def destroy
    reset_session
    redirect_to root_url, notice: "See ya!"
  end

end
