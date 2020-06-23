class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  include Pundit

  def current_user
    User.find_by(id: session[:user_id])
  end
end
