require "rails_helper"

RSpec.describe Collection, type: :model do
  describe "Association" do
    it { should have_many(:users) }
    it { should have_many(:tickets) }
    it { should have_many(:feature_types) }
  end
end
