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

require 'test_helper'

class DiscoverySessionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
