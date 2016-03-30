class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborations
  has_many :users, through: :collaborations

  def collaboration_for(user)
    collaborations.where(user: user).first
  end

  extend FriendlyId
  friendly_id :title, use: :slugged

end
