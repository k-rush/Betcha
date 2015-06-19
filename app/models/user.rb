class User < ActiveRecord::Base
	has_secure_password
	has_many :bet
	
  def editor?
    self.role == 'editor'
  end
end
