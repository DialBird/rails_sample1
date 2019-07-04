# == Schema Information
#
# Table name: plans
#
#  id             :bigint           not null, primary key
#  amount         :integer          default(0), not null
#  currency       :string           default(""), not null
#  interval       :string           default(""), not null
#  interval_count :integer          default(0), not null
#  nickname       :string           default(""), not null
#  usage_type     :string           default(""), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  product_id     :bigint
#  stripe_id      :string           default(""), not null
#
# Indexes
#
#  index_plans_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#

class Plan < ApplicationRecord
  belongs_to :product

  validates :amount, presence: true
  validates :currency, presence: true
  validates :interval, presence: true
  validates :interval_count, presence: true
  validates :nickname, presence: true, uniqueness: true
  validates :stripe_id, presence: true, uniqueness: true
  validates :usage_type, presence: true
end
