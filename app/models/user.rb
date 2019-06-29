# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string           default(""), not null
#  name       :string           default(""), not null
#  provider   :string           default(""), not null
#  uid        :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email)
#  index_users_on_uid    (uid)
#

class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :provider, presence: true
  validates :uid, presence: true, uniqueness: true
end
