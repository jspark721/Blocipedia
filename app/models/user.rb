class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :wikis

  belongs_to :plan

  before_save { self.role ||= :member}

  enum role: [:member, :admin, :premium]

  attr_accessor :stripe_card_token

  def save_with_payment
    if valid?
      # using stripe gem to send out information to stripe server
      customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_card_token)
      self.stripe_customer_token = customer.id
      self.role = :premium
      save!
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was an error with your credit card."
    false
  end

end
