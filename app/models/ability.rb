class Ability < ActiveRecord::Base
	self.table_name = 'tlkpAbility'
	has_many :person
end