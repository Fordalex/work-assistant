class SettingsController < SessionsController
  before_action :set_setting, only: %i[edit update destroy]

  def new
    @setting = Setting.new
  end

  def create
    setting = Setting.new(settings_params.merge(user: current_user))
    if setting.save!
      flash[:success] = "#{setting.category.name} setting has been added!"
    else
      flash[:warning] = "An error occured please try again"
      render "edit"
    end
    redirect_to notes_path
  end

  def edit
  end

  def update
    if @setting.update(settings_params)
      flash[:success] = "Your settings have updated!"
      redirect_to notes_path
    else
      flash[:warning] = "An error occured please try again"
      render "edit"
    end
  end

  def destroy
    @setting.destroy
    redirect_to home_path
  end

  private

  def set_setting
    @setting = Setting.find_by(user: current_user)
  end

  def settings_params
    params.require(:setting).permit(:theme)
  end
end
