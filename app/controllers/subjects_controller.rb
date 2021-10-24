class SubjectsController < ApplicationController
  def create
    subject = Subject.new(subjects_params.merge(user: current_user))
    if subject.save!
      flash[:success] = "#{subject.name} subject has been added!"
    else
      flash[:warning] = "An error occured please try again"
    end

    redirect_to cms_path
  end

  private

  def subjects_params
    params.require(:subject).permit(:name, :content)
  end
end
