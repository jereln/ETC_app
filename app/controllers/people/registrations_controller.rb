class People::RegistrationsController < Devise::RegistrationsController
  before_action :set_family
  before_action :set_person
  before_action :authorize_family, only: [:edit, :update]

  protected
  def set_family
    @relationship = Relationship.find_by person_id: current_person.id
    @family = Family.find(@relationship.id)
    @family_members = Relationship.where("FamilyID = '#{@family.FamilyID}'")
  end

  def set_person
    if params[:format] == nil
      @person = current_person
    else
      @person = Person.find_by( PersonID: params[:format] )
    end
  end

  def authorize_family
    if params[:format] != nil
      unless @family_members.collect { |id| id.person_id}.include? (params[:format].to_i)
        flash[:notice] = 'You are unauthorized to do this'
        redirect_to root_path 
      end
    end
  end
end