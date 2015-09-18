class Voter < ActiveRecord::Base

  before_save :generate_voter_id, :on => :create


  def generate_voter_id
    self.voter_id = SecureRandom.hex(5)
  end

end
