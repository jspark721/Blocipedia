class Collaborator < ActiveRecord::Base
  belongs_to :wiki_id
  has_many :user_ids
end
