require "rails_helper"

RSpec.describe User, type: :model do
  describe "Association" do
    it { should have_many(:user_groups) }
  end
end
