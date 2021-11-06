class ApplicationController < ActionController::Base
  before_action :set_setting

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
end
