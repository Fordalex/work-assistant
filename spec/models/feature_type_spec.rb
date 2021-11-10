require "rails_helper"

RSpec.describe FeatureType, type: :model do
  describe "Association" do
    it { should belong_to(:user) }
    it { should belong_to(:feature) }
  end
end
