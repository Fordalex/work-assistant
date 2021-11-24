# frozen_string_literal: true

require "rails_helper"
require "shared/request_helpers.rb"

RSpec.describe "Features", type: :request do
  sign_in

  let(:feature_type) {FactoryBot.create(:feature_type, name: "Language")}

  def params
    {
      feature: {
        name: "The name",
        colour: "#fff",
        feature_type_id: feature_type.id
      }
    }
  end

  def expected_feature_values(feature)
    expect(feature.name).to eq "The name"
    expect(feature.colour).to eq "#fff"
    expect(feature.feature_type).to eq feature_type
  end

  describe "GET /tickets/new" do
    it "return 200 status response" do
      get new_feature_path

      expect(response.status).to eq 200
    end
  end

  describe "POST /features" do
    context "with valid params" do
      before do
        post features_path, params: params
      end

      it "create a new feature" do
        expect(response).to redirect_to cms_path
        expected_feature_values Feature.first
      end

      it "sets a flash message" do
        feature = Feature.first
        expect(flash[:success]).to eq "#{feature.name} feature has been added!"
      end
    end
  end

  describe "GET /features/:id/edit" do
    it "return 200 status response" do
      feature = FactoryBot.create(:feature)
      get edit_feature_path(feature)

      expect(response.status).to eq 200
    end
  end

  describe "PATCH /tickets/:id" do
    before do
      old_feature_type = FactoryBot.create(:feature_type)
      feature = FactoryBot.create(:feature, name: "Old name", colour: "#000", feature_type: old_feature_type)
      patch "/features/#{feature.id}", params: params
    end

    it "update a feature values" do
      expect(response).to redirect_to cms_path
      expected_feature_values Feature.first
    end

    it "set a flash message" do
      feature = Feature.first
      expect(flash[:success]).to eq "#{feature.name} feature has been updated!"
    end
  end

  describe "DELETE /features/:id" do
    it "removes a feature" do
      feature = FactoryBot.create(:feature)

      delete feature_path(feature)

      expect(Feature.count).to be_zero
    end
  end
end
