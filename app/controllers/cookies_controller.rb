class CookiesController < ApplicationController

  @@sessions = []

  # GET /cookies
  def index
    @desert = session[:fav_desert]
    @cookies = Cookie.all
  end

  # GET /cookies/1
  def show
    redirect_to root_path and return if not is_logged_in

    ## CHALLENGE 3: This is my favorite cookie!
    ## Detect whether the cookie the user is viewing
    ## is their favorite_cookie, and add the words
    ## 'FAVORITE COOKIE' in the `views/cookies/show.html.erb` template

    @cookie = Cookie.find(params[:id])
  end

  # GET /cookies/favorite
  def favorite
    redirect_to root_path and return if not is_logged_in

    ## CHALLENGE 4: Render my favorite_cookie
    ## by first checking my session for `favorite_cookie_id`
    favorite_cookie_id = 1 # CHANGE THIS to my favorite_cookie_id!!!
    @cookie = Cookie.find(favorite_cookie_id)
    render 'show'
  end

  # Get /cookies/1/save_as_favorite
  # This is a nasty bad un-RESTful route! :(
  def save_as_favorite
    redirect_to root_path and return if not is_logged_in
    fav_cookie_id = params[:id]
    session[:fav_cookie_id] = fav_cookie_id
    redirect_to favorite_cookie_path
  end

  private

  def is_logged_in
    cookies[:can_has] == "yarly"
  end

end
