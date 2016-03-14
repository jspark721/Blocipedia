class ChargesController < ApplicationController

  before_filter :authenticate_user!
  
  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Premium Membership - #{current_user.name}",
      amount: @amount
    }
  end

  def create
    @amount = 15_00

    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: "Premium Membership - #{current_user.email}",
      currency: 'usd'
    )

    flash[:notice] = "Thank you for your payment, #{current_user.email}!"
    redirect_to root_path(current_user)
  end

rescue Stripe::CardError => e
  flash.now[:alert] = e.message
  redirect_to new_charge_path
end
