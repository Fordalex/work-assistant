class LanguagesController < SessionsController
  before_action :set_language, only: %i[destroy]

  def create
    @language = Language.new(language_params.merge(user: current_user))
    if @language.save
      flash[:success] = "#{@language.name} has been saved!"
    else
      flash[:warning] = "An error occurred please try again."
    end
    redirect_to cms_path
  end

  def destroy
    if @language.destroy
      flash[:success] = "Technology destroyed"
    end
    redirect_to cms_path
  end

  private

  def language_params
    params.require(:language).permit(:name, :colour)
  end

  def set_language
    @language = Language.find(params[:id])
  end
end
