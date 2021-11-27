# frozen_string_literal: true

require "rails_helper"
require "shared/request_helpers.rb"

RSpec.describe "Collections", type: :request do
  let!(:user) { FactoryBot.create(:user) }

  before do
    allow_any_instance_of(CollectionsController).to receive(:authenticate_user!).and_return(user)
    allow_any_instance_of(CollectionsController).to receive(:current_user).and_return(user)
  end

  def params
    {
      collection: {
        name: "The name",
        template: "",
      }
    }
  end

  def expected_collection_values(collection)
    expect(collection.name).to eq "The name"
    expect(collection.user_groups.first.user).to eq user
  end

  describe "GET /collections/new" do
    it "return 200 status response" do
      get new_collection_path

      expect(response.status).to eq 200
    end
  end

  describe "POST /collections" do
    context "with valid params" do
      before do
        post collections_path, params: params
      end

      it "create a new collection" do
        expect(response).to redirect_to cms_path
        expected_collection_values Collection.last
      end

      it "sets a flash message" do
        collection = Collection.last
        expect(flash[:success]).to eq "#{collection.name} collection has been added!"
      end
    end
  end

  describe "GET /collections/:id/edit" do
    it "return 200 status response" do
      collection = FactoryBot.create(:collection)
      get edit_collection_path(collection)

      expect(response.status).to eq 200
    end
  end

  describe "PATCH /collection/:id" do
    before do
      collection = FactoryBot.create(:collection, name: "Old name")
      FactoryBot.create(:user_group, collection: collection, user: user)
      patch "/collections/#{collection.id}", params: params
    end

    it "update a collection values" do
      expect(response).to redirect_to collections_path
      expected_collection_values Collection.last
    end

    it "set a flash message" do
      collection = Collection.last
      expect(flash[:success]).to eq "#{collection.name} collection has been updated!"
    end
  end

  describe "DELETE /collections/:id" do
    it "removes a collection" do
      pp Collection.count
      collection = FactoryBot.create(:collection)

      delete collection_path(collection)

      expect(Collection.count).to be_zero
      expect(response).to redirect_to collections_path
    end
  end
end
