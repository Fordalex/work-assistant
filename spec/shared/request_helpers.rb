def sign_in
  user_setup
  let!(:user) { FactoryBot.create(:user) }
  let!(:session) { {collection_id: collection.id} }

  before do
    allow_any_instance_of(SessionsController).to receive(:authenticate_user!).and_return(user)
    allow_any_instance_of(SessionsController).to receive(:current_user).and_return(user)
  end
end

def user_setup
  let!(:collection) { FactoryBot.create(:collection) }
  let!(:user_group) { FactoryBot.create(:user_group, user: user, collection: collection) }

  before do
    allow_any_instance_of(SessionsController).to receive(:session).and_return(session)
  end
end
