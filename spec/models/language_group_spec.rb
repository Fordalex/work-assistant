require "rails_helper"

RSpec.describe LanguageGroup, type: :model do
  describe "Association" do
    it { should belong_to(:ticket) }
    it { should belong_to(:language) }
  end
end
