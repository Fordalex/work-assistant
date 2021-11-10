require "rails_helper"

RSpec.describe Feature, type: :model do
  describe "Association" do
    it { should belong_to(:user) }
    it { should belong_to(:feature_type) }
    it { should have_many(:feature_groups) }
  end
end
