require "rails_helper"

RSpec.describe FeatureType, type: :model do
  describe "Association" do
    it { should belong_to(:collection) }
    it { should have_many(:features) }
  end
end
