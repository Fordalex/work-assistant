require "rails_helper"

RSpec.describe LanguageGroup, type: :model do
  describe "Association" do
    it { should have_many(:tickets) }
    it { should have_many(:languages) }
  end
end
