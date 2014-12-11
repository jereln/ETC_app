class Person < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	self.table_name = 'tblPerson'

	belongs_to :abilities

	alias_attribute :email, :Email
	alias_attribute :first_name, :FirstName
	alias_attribute :last_name, :LastName
	alias_attribute :gender, :Gender
	alias_attribute :birthdate, :BirthDate
	alias_attribute :address, :Address
	alias_attribute :city, :City
	alias_attribute :state, :State
	alias_attribute :zip_code, :ZipCode
end