require "rails_helper"
require "shared/request_helpers.rb"

RSpec.describe "Notes", type: :request  do
  sign_in

  let(:collection) { FactoryBot.create(:collection) }
  let(:feature_type) { FactoryBot.create(:feature_type, name: "Language", collection: collection) }

  let(:feature) { FactoryBot.create(:feature, feature_type: feature_type, name: "Ruby") }
  let(:css) { FactoryBot.create(:feature, feature_type: feature_type, name: "CSS") }

  let!(:ruby_ticket) { FactoryBot.create(:ticket, collection: collection, title: "Ruby ticket") }
  let!(:css_ticket) { FactoryBot.create(:ticket, collection: collection, title: "CSS ticket") }

  before do
    allow_any_instance_of(SessionsController).to receive(:current_user).and_return(user)

    FactoryBot.create(:user_group, user: user, collection: collection)
    FactoryBot.create(:feature_group, ticket: ruby_ticket, feature: feature)
    FactoryBot.create(:feature_group, ticket: css_ticket, feature: css)
  end

  describe "GET /notes" do
    context "when no search params are present" do
      it "returns 200 status response" do
        get notes_path

        expect(response.status).to eq 200
      end

      it "returns all tickets" do
        get notes_path

        assert_select ".notes-ticketWrapper", {count: 2}
      end

      it "only displays tickets related to the search" do
        params = {
          feature_types: {
            "#{feature_type.id}": {
              "#{feature.id}": "",
              and_or: "And"
            },
          },
          date: "",
          commit: "Search"
        }

        get notes_path, params: params

        assert_select ".notes-ticketWrapper", {count: 1}
      end
    end
  end
end
