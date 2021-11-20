require "rails_helper"

RSpec.describe UserGroup, type: :model do
  describe "Association" do
    it { should belong_to(:collection) }
    it { should belong_to(:user) }
  end
end
