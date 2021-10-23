class CmsController < SessionsController
  def cms
    @category = Category.new

    @subjects = []
    @categories = Category.where(user: current_user)
    @members = []
  end
end
