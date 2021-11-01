class SubjectsController < ApplicationController
  before_action :set_subject, only: %i[destroy]

  def create
    subject = Subject.new(subjects_params.merge(user: current_user))
    if subject.save!
      flash[:success] = "#{subject.name} subject has been added!"
    else
      flash[:warning] = "An error occured please try again"
    end

    redirect_to cms_path
  end

  def destroy
    if @subject.destroy
      flash[:success] = "Subject destoryed."
    end
    redirect_to cms_path
  end

  private

  def subjects_params
    params.require(:subject).permit(:name, :content)
  end

  def set_subject
    @subject = Subject.find(params[:id])
  end
end
