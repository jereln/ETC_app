class Ability < ActiveRecord::Base
	self.table_name = 'tlkpAbility'
	has_many :person, foreign_key: :ability_id_usta

	alias_attribute :description, :Description
	alias_attribute :is_adult, :IsAdult
end