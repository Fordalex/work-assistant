class CmsController < SessionsController
  def cms
    @subjects = []
    @categories = Category.where(user: current_user)
    @members = []
  end
end
