require 'rails_helper'

describe UserTokenController do
  let(:user) { create(:user) }

  context 'POST user_token' do
    it "return an access_token" do
      post :create, auth: {
                      email: user.email,
                      password: '123123123'
                    },
                    format: :json
      expect(response).to be_created
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['jwt']).not_to be_nil
    end

    it "return error if credential is wrong" do
      post :create, auth: {
                      email: user.email,
                      password: ''
                    },
                    format: :json
      expect(response).to be_not_found
    end
  end
end
