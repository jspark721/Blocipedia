require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:new_user_attributes) do
    {
        name: "Example",
        email: "user@example.com",
        password: "helloworld",
        password_confirmation: "helloworld"
    }
  end
end
