class Rule < ActiveRecord::Base

  scope :pending, where(:state => 'pending')
  scope :denied, where(:state => 'denied')
  scope :approved, where(:state => 'approved')

  state_machine :state, :initial => :pending do
    event :approve do
	  transition [:pending, :denied] => :approved
	end
	
	event :deny do
	  transition [:pending, :approved] => :denied
	end
	
	state :pending
	state :approved
	state :denied
  end

end
