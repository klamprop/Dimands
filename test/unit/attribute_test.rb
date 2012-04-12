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

require 'test_helper'

class AttributeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
