class SessionsController < ApplicationController

  def new
  end

  def create
    c = Client.find_by(id: params["id"])

    if c != nil
      if c.password == params["password"]
        # cookies["user_id"] = u.id
        session["client_id"] = c.id
        redirect_to "/", notice: "Welcome back, #{c.client_name}!"
      else
        redirect_to "/sessions/new", alert: "Bad password"
      end
    else
      redirect_to "/sessions/new", alert: "Unknown user"
    end

  end

  def destroy
    # cookies.delete("user_id")
    # cookies["user_id"] = nil
    reset_session
    redirect_to root_url, notice: "See ya!"
  end

end
