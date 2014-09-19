# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)      default(""), not null
#  name            :string(255)
#  token           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  active          :boolean          default(TRUE)
#  password_digest :string(255)
#

require 'spec_helper'

describe User do

  describe '.authenticate' do
    let!(:user) { create(:user, password: 'secret') }

    it "returns nil if authentication fails" do
      expect( User.authenticate(user.email, 'wrong') ).to be_false
    end

    it "returns the user object if authentication succeeds" do
      expect( User.authenticate(user.email, 'secret') ).to eql user
    end
  end
end
