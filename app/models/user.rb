class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :wikis

  after_initialize :default_role

  enum role: [:standard, :admin, :premium]

  def standard?
    role == 'standard'
  end

  def admin?
    role == 'admin'
  end

  def premium?
    role == 'premium'
  end

  def default_role
    self.role ||= :standard
  end

end
