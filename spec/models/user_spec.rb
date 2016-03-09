require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) { @user = User.new(name: "example user", email: 'user@example.com', password: "helloworld", password_confirmation: "helloworld") }
  let (:user) { create(:user) }
  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:name) }

  it "#email returns a string" do
    expect(@user.email).to match 'user@example.com'
  end

  describe "attributes" do
    it "responds to role" do
       expect(user).to respond_to(:role)
     end

     it "responds to admin?" do
       expect(user).to respond_to(:admin?)
     end

     it "responds to member?" do
       expect(user).to respond_to(:member?)
     end
   end

   describe "roles" do
     it "is member by default" do
       expect(user.role).to eql("member")
     end

     context "member user" do
       it "returns true for #member?" do
         expect(user.member?).to be_truthy
       end

       it "returns false for #admin?" do
         expect(user.admin?).to be_falsey
       end
     end

     context "admin user" do
       before do
         user.admin!
       end

       it "returns false for #member?" do
         expect(user.member?).to be_falsey
       end

       it "returns true for #admin?" do
         expect(user.admin?).to be_truthy
       end
     end
   end
end
