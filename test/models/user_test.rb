require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user should have role" do  
    assert_not(@subject.role? :admin)
    
    @subject.roles << Role.new(name: "admin")
    
    assert(@subject.role? :admin)  
    end  
end
