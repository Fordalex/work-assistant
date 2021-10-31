class MembersController < SessionsController
  before_action :set_member, only: %i[destroy]

  def create
    @member = Member.new(member_params.merge(user: current_user))
    if @member.save
      flash[:success] = "#{@member.name} has been saved!"
    else
      flash[:warning] = "An error occurred please try again."
    end
    redirect_to cms_path
  end

  def destroy
    if @member.destroy
      flash[:success] = "Member has been destroyed"
    end
    redirect_to cms_path
  end

  private

  def member_params
    params.require(:member).permit(:name, :colour)
  end

  def set_member
    @member = Member.find(params[:id])
  end
end
