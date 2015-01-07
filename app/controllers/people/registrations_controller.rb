class People::RegistrationsController < Devise::RegistrationsController
  before_action :set_family

  protected
  def set_family
    @relationship = Relationship.find_by person_id: current_person.id
    @family = Family.find(@relationship.id)
    @family_members = Relationship.where("FamilyID = '#{@family.FamilyID}'")
  end
end