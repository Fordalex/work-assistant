require "rails_helper"

RSpec.describe Language, type: :model do
  describe "Association" do
    it { should belong_to(:user) }
    it { should have_many(:language_groups) }
  end
end
