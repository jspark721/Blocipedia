class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborations

  scope :visible_to, -> (user) { user && ((user.role == 'premium') || (user.role == 'admin')) ? all : where(private: false)  }
end
