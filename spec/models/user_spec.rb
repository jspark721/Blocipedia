require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) { @user = User.new(name: "example user", email: 'user@example.com', password: "helloworld", password_confirmation: "helloworld") }

  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:name) }

  it "#email returns a string" do
    expect(@user.email).to match 'user@example.com'
  end
end
