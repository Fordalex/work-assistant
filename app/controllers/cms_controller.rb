class CmsController < TicketsController
  before_action :set_members, only: %i[cms]
  before_action :set_subjects, only: %i[cms]
  before_action :set_languages, only: %i[cms]
  before_action :set_categories, only: %i[cms]

  def cms
    @category = Category.new
    @subject = Subject.new
    @member = Member.new
    @language = Language.new
  end
end
