# == Schema Information
#
# Table name: settlements
#
#  id         :integer          not null, primary key
#  project_id :integer
#  payer_id   :integer
#  payee_id   :integer
#  amount     :decimal(8, 2)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Settlement do

  it "validates that the payer and payee are members of the project"

end
