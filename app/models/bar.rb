# == Schema Information
#
# Table name: bars
#
#  id         :integer          not null, primary key
#  bar_name   :string(255)
#  lat        :float
#  long       :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Bar < ActiveRecord::Base
  attr_accessible :bar_name, :lat, :long, :password, :password_confirmation
  has_secure_password

  VALID_FLOAT_REGEX = /[-+]?([0-9]*\.[0-9]+|[0-9]+)/i
  validates :bar_name, presence: true, length: { maximum: 50 }
  
  validates :lat, presence: true, format: { with: VALID_FLOAT_REGEX }
  validates :long, presence: true, format: { with: VALID_FLOAT_REGEX }
  validates_uniqueness_of :lat, :scope => :long
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
end
