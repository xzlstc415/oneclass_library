require 'rails_helper'

describe User do
  let(:user) { build(:user) }

  it 'has a valid factory' do
    expect(user).to be_valid
  end

  it "is invalid without email" do
    user.email = nil
    expect(user).to be_invalid
  end
end
