class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @basic_plan = Plan.find(1)
    @premium_plan = Plan.find(2)
  end
end
