class PeopleController < ApplicationController
  before_action :set_person, only: [:edit, :show, :update]
  before_action :set_family
  before_action :authorize_family, only: [:edit, :update]

  def index
    @people = Person.all
  end

  def show
    @person = Person.find(params[:id])
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    if @person.update(person_params)
      redirect_to root_path, notice: "Profile sucessfully updated"
    else
      render :edit
    end
  end

  protected
  def set_person
    @person = Person.find(params[:id])
  end

  def set_family
    @relationship = Relationship.find_by person_id: current_person.id
    @family = Family.find(@relationship.id)
    @family_members = Relationship.where("FamilyID = '#{@family.FamilyID}'")
  end

  def person_params
    params.require(:person).permit(
      :email,
      :first_name,
      :last_name,
      :gender,
      :birthdate,
      :address,
      :city,
      :state,
      :zip_code,
      :home_phone,
      :work_phone,
      :cell_phone,
      :best_contact,
      :ability_id_usta,
      :ability_id_self
      )
  end

  def authorize_family
    unless @family_members.collect { |id| id.person_id}.include? (params[:id].to_i)
      flash[:notice] = 'You are unauthorized to do this'
      redirect_to root_path 
    end
  end
end