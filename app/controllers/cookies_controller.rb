class CookiesController < ApplicationController

  # GET /cookies
  def index
    @cookies = Cookie.all
  end

  # GET /cookies/1
  def show
    redirect_to root_path unless cookies[:can_has] == "yarly"
    @cookie = Cookie.find(params[:id])
  end

end
