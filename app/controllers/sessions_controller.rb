class SessionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_setting
  before_action :set_collection

  private

  def set_setting
    if user_signed_in?
      @setting = Setting.find_by(user: current_user)
      unless @setting
        create_setting
      end
    end
  end

  def create_setting
    Setting.create(user: current_user)
    set_setting
  end

  def set_collection
    # TODO save collection_id to the users profile instead of a session
    @collection = Collection.find_by(id: session[:collection_id])
    unless @collection
      flash[:warning] = "A collection needs to be selected first"
      redirect_to collections_path
    end
  end
end
