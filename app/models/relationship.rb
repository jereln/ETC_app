class Relationship < ActiveRecord::Base
  self.table_name = 'trelFamilyPerson'

  belongs_to :family, foreign_key: :FamilyID
  belongs_to :person, foreign_key: :PersonID

  alias_attribute :person_id, :PersonID
  alias_attribute :family_id, :FamilyID
end