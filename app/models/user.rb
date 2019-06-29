# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  email              :string           default(""), not null
#  name               :string           default(""), not null
#  profile_image_data :text
#  provider           :string           default(""), not null
#  uid                :string           default(""), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email)
#  index_users_on_uid    (uid)
#

class User < ApplicationRecord
  include ProfileImageUploader::Attachment.new(:profile_image)

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :provider, presence: true
  validates :uid, presence: true, uniqueness: true

  class << self
    def from_omniauth(auth)
      find_or_create_by(uid: auth.uid) do |user|
        user.email = auth.info.email
        user.name = auth.info.name
        user.profile_image_remote_url = auth.info.image
        user.provider = auth.provider
      end
    end
  end
end
