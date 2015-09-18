class Startup < ActiveRecord::Base

  before_save :generate_startup_id, :on => :create
  has_many :voters

  def generate_startup_id
    self.startup_id = SecureRandom.hex(5)
  end

end
