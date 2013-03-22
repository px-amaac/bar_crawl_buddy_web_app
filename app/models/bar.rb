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
  attr_accessible :bar_name, :lat, :long

  validates :bar_name, presence: true, length: { maximum: 50 }
  validates :lat, presence: true
  validates :long, presence: true
end
