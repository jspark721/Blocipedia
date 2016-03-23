class Collaborator < ActiveRecord::Base
  belongs_to :wikis
  has_many :users
end
