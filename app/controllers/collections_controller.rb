class CollectionsController < ApplicationController
  include CollectionHelper
  before_action :authenticate_user!

  def index
    @collection = Collection.find_by(id: session[:collection_id])
    @collections = Collection.joins(:user_groups).where(user_groups:{ user: current_user})
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.new(name: collection_params[:name])
    if @collection.save!
      UserGroup.create!(user: current_user, collection: @collection)
      template = collection_params[:template]
      if template === "Web Developer"
        web_developer_template(@collection)
      end
      redirect_to collections_path
    else
      render 'new'
    end
  end

  def set_collection
    if Collection.find_by(id: params[:id])
      session[:collection_id] = params[:id]
      redirect_to home_path
    else
      redirect_to collections_path
    end
  end

  private

  def collection_params
    params.require(:collection).permit(:name, :template)
  end
end
