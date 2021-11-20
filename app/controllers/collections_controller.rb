class CollectionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @collection = Collection.find_by(id: session[:collection_id])
    @collections = Collection.joins(:user_groups).where(user_groups:{ user: current_user})
  end

  def set_collection
    if Collection.find_by(id: params[:id])
      session[:collection_id] = params[:id]
      redirect_to home_path
    else
      redirect_to collections_path
    end
  end
end
