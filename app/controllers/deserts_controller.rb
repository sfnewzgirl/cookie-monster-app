class DesertsController < ApplicationController

  # GET /deserts
  def index
    @deserts = Desert.all
  end

  # GET /deserts/1
  def show
    redirect_to root_path and return if not is_logged_in

    ## CHALLENGE 4: This is my favorite desert!
    ### Detect whether the desert the user is viewing
    ### is their favorite_desert, and add the words
    ### 'FAVORITE DESERT' in the `views/deserts/show.html.erb` template

    @desert = Desert.find(params[:id])
  end

  # GET /deserts/favorite
  # Shows the user's favorite desert (if set in the session)
  def favorite
    redirect_to root_path and return if not is_logged_in

    ## CHALLENGE 3: Render my favorite_desert!
    ### Check my session for my `favorite_desert_id`
    ### and then render my favorite desert
    favorite_desert_id = 1 # CHANGE THIS
    @desert = Desert.find(favorite_desert_id)
    render 'show'
  end

  # POST /deserts/1/save_as_favorite
  # Sets the user's favorite desert in their session
  def save_as_favorite
    redirect_to root_path and return if not is_logged_in
    id = params[:id]
    session[:favorite_desert_id] = id # Set favorite
    flash[:notice] = "Desert ##{id} saved in session as favorite!"
    redirect_to root_path
  end

  private

  def is_logged_in
    cookies[:can_has] == "yarly"
  end

end
