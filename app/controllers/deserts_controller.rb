class DesertsController < ApplicationController

  # GET /deserts
  def index
    @deserts = Desert.all
  end

  # GET /deserts/1
  def show
    redirect_to root_path and return if not is_logged_in

    ## CHALLENGE 4: This is my favorite desert!
    ## Detect whether the desert the user is viewing
    ## is their favorite_desert, and add the words
    ## 'FAVORITE DESERT' in the `views/deserts/show.html.erb` template

    @desert = Desert.find(params[:id])
  end

  # GET /deserts/favorite
  def favorite
    redirect_to root_path and return if not is_logged_in

    ## CHALLENGE 3: Render my favorite_desert
    ## by first checking my session for `favorite_desert_id`
    favorite_desert_id = 1 # CHANGE THIS to my favorite_desert_id!!!
    @desert = Desert.find(favorite_desert_id)
    render 'show'
  end

  # Get /deserts/1/save_as_favorite
  # This is a nasty bad un-RESTful route! :(
  def save_as_favorite
    redirect_to root_path and return if not is_logged_in
    fav_desert_id = params[:id]
    session[:fav_desert_id] = fav_desert_id
    flash[:notice] = "Desert ##{fav_desert_id} saved in session as favorite!"
    redirect_to root_path
  end

  private

  def is_logged_in
    cookies[:can_has] == "yarly"
  end

end
