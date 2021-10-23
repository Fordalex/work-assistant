require "rails_helper"

RSpec.describe Category, type: :model do
  describe "Association" do
    it { should have_many(:tickets) }
    it { should belong_to(:user) }
  end
end
