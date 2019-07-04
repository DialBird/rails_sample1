# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  name       :string           default(""), not null
#  type       :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :type, presence: true
end
