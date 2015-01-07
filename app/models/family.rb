class Family < ActiveRecord::Base
  self.table_name = 'tblFamily'

  has_many :relationships
  has_many :families, through: :relationships

  alias_attribute :family_name, :FamilyName
end