class ManagerRelationship < ActiveRecord::Base
  attr_accessible :bar_id

  belongs_to :user
  belongs_to :bar

  validates :user_id, presence: true
  validates :bar_id, presence: true

end
