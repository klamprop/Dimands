# == Schema Information
#
# Table name: attributes
#
#  id          :integer         not null, primary key
#  content     :string(255)
#  identity_id :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Attribute < ActiveRecord::Base
  attr_accessible :content
  belongs_to :identity

  validates :content, presence: true
  validates :identity_id, presence: true
end
