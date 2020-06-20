require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  should have_many(:UserRoles)
  should have_many(:Users).through(:UserRoles)  
  should validate_presence_of(:name)  
  should validate_uniqueness_of(:name) 
end
