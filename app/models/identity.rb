# == Schema Information
#
# Table name: identities
#
#  id         :integer         not null, primary key
#  identifier :string(255)
#  domain     :string(255)
#  TRID       :integer
#  RID        :integer
#  user_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Identity < ActiveRecord::Base
  attr_accessible :identifier, :domain
  belongs_to :user
  has_many :attributes, dependent: :destroy

  validates :identifier, presence: true
  validates :domain, presence:true
  validates :user_id, presence: true
#  default_scope order: 'identities.created_at DESC'
end
