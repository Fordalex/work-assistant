require "rails_helper"

RSpec.describe Ticket, type: :model do
  describe "Association" do
    it { should belong_to(:collection) }
    it { should have_many(:feature_groups) }
  end
end
