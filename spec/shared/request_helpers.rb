def sign_in
  let(:user) { FactoryBot.create(:user) }

  before do
    allow_any_instance_of(TicketsController).to receive(:authenticate_user!).and_return(true)
    allow_any_instance_of(TicketsController).to receive(:current_user).and_return(user)
  end
end
