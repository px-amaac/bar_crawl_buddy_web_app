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
end
