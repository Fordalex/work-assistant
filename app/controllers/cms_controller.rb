class CmsController < SessionsController
  def cms
    @category = Category.new
    @subject = Subject.new


    @categories = Category.where(user: current_user)
    @members = Member.where(user: current_user)
    @subjects = Subject.where(user: current_user)
  end
end
