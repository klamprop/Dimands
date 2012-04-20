# == Schema Information
#
# Table name: discovery_sessions
#
#  id                   :integer         not null, primary key
#  RID                  :integer
#  discovery_session_id :integer
#  created_at           :datetime        not null
#  updated_at           :datetime        not null
#

class DiscoverySession < ActiveRecord::Base
 belongs_to :user

  scope :recent , lambda { where("created_at > :timeout", {:timeout => DiscoverySessionIdTimeout.ago})}

  # FIX ME: Should be unique
  def self.unique_session_id
    rand(10000)
  end

  def to_session_number
    s = DiscoverySessionNumber.new
    s.id = discovery_session_id
    return s
end
end
