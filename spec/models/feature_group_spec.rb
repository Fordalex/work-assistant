require "rails_helper"

RSpec.describe FeatureGroup, type: :model do
  describe "Association" do
    it { should belong_to(:ticket) }
    it { should belong_to(:feature) }
  end
end
