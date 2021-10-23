require "rails_helper"

RSpec.describe Category, type: :model do
  describe "Association" do
    it { should have_many(:tickets) }
  end
end
