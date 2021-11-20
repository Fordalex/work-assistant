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
    @collection = Collection.find_by(id: session[:collection_id])
    redirect_to collections_path unless @collection
  end
end
