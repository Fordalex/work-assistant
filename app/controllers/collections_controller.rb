class CollectionsController < ApplicationController
  include CollectionHelper
  before_action :authenticate_user!
  before_action :set_collection, only: %i[edit update destroy]

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
      session[:collection_id] = @collection.id
      flash[:success] = "#{@collection.name} collection has been added!"
      redirect_to cms_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @collection.update(name: collection_params[:name])
      flash[:success] = "#{@collection.name} collection has been updated!"
      redirect_to collections_path
    else
      flash[:warning] = "Something went wrong, try again."
    end
  end

  def destroy
    @collection.destroy
    redirect_to collections_path
  end

  def set_collection_in_session
    if Collection.find_by(id: params[:id])
      session[:collection_id] = params[:id]
      redirect_to home_path
    else
      redirect_to collections_path
    end
  end

  private

  def set_collection
    @collection = Collection.find_by(id: params[:id])
  end

  def collection_params
    params.require(:collection).permit(:name, :template)
  end
end
