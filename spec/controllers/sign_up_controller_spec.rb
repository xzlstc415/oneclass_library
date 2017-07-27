require 'rails_helper'

describe SignUpController do
  let(:user) { create(:user) }
  let(:account) { create(:account, users: [user]) }

  context 'POST create' do
    it "create signup a new user with valid attributes" do
      expect {
        post :create, email: 'test@gmail.com',
                      password: '123123123',
                      format: :json
      }.to change { User.count }.by 1
      expect(response).to be_created
    end

    it "does not create new user when email is missing" do
      expect {
        post :create, email: '',
                      password: '123123123',
                      format: :json
      }.to change { User.count }.by 0
      expect(response).to be_unprocessable
    end

    it "does not create new user when password is missing" do
      expect {
        post :create, email: 'test@gmail.com',
                      password: '',
                      format: :json
      }.to change { User.count }.by 0
      expect(response).to be_unprocessable
    end
  end
end
