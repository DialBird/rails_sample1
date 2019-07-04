# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  name       :string           default(""), not null
#  type       :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  stripe_id  :string           default(""), not null
#

class Product < ApplicationRecord
  self.inheritance_column = :_type_disabled

  has_many :plans, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :stripe_id, presence: true, uniqueness: true
  validates :type, presence: true
end
