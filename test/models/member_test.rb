require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  
  test "should not save member without name" do
    member = Member.new
    assert !member.save, "Member must have a name"
  end

  test "should only allow one member with the same name" do
    member = Member.new
    member.name = Member.first.name
    assert !member.valid?
    assert member.errors[:name].include? "has already been taken"
  end
end
