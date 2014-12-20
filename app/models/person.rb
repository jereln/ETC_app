class Person < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	self.table_name = 'tblPerson'

	belongs_to :ability

	alias_attribute :email, :Email
	alias_attribute :first_name, :FirstName
	alias_attribute :last_name, :LastName
	alias_attribute :gender, :Gender
	alias_attribute :birthdate, :BirthDate
	alias_attribute :address, :Address
	alias_attribute :city, :City
	alias_attribute :state, :State
	alias_attribute :zip_code, :ZipCode
  alias_attribute :home_phone, :HomePhone
  alias_attribute :work_phone, :WorkPhone
  alias_attribute :cell_phone, :CellPhone
  alias_attribute :ability_id_usta, :AbilityID_USTA
  alias_attribute :ability_id_self, :AbilityID_Self
  alias_attribute :best_contact, :BestContact
end