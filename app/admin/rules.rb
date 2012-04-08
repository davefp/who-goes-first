ActiveAdmin.register Rule do

  scope :pending, :default => true
  scope :denied
  scope :approved
  scope :all

  index do
    column :id
    column ("State") do |rule|
	  case rule.state
	  when 'pending'
	    status_tag(rule.state, :orange)
	  when 'approved'
	    status_tag(rule.state, :green)
	  when 'denied'
	    status_tag(rule.state, :red)
	  end
	end
	column "Actions" do |rule|
	  case rule.state
	  when 'pending'
        link_to('Approve', approve_admin_rule_path(rule), :method => :put) + 
		' | ' + link_to('Deny', deny_admin_rule_path(rule), :method => :put)
      when 'denied'
	    link_to('Approve', approve_admin_rule_path(rule), :method => :put)
	  when 'approved'
	    link_to('Deny', deny_admin_rule_path(rule), :method => :put)
	  end
    end
	column :rule_text
	column :created_at
	column :updated_at
	default_actions
  end
  
  member_action :approve, :method => :put do
    rule = Rule.find(params[:id])
	rule.approve
	redirect_to admin_rules_path, :notice => "Rule #{rule.id} approved!"
  end
  
  member_action :deny, :method => :put do
    rule = Rule.find(params[:id])
	rule.deny
	redirect_to admin_rules_path, :notice => "Rule #{rule.id} denied!"
  end

end
