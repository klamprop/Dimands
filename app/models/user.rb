# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  usid            :integer
#  username        :string(255)
#  password_digest :string(255)
#  admin           :boolean         default(FALSE)
#

class User < ActiveRecord::Base
  attr_accessible :name, :email, :username, :password, :password_confirmation
  has_secure_password
  has_many :identities, dependent: :destroy

  validates :name, presence: true
 
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false}

  validates :password, length: {minimum: 6}

  validates :password_confirmation, presence: true

  validates :username, presence:true,
                       uniqueness: true

#  validates :usid, uniqueness: true
end
