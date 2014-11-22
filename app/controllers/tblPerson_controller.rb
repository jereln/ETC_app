class tblPersonController < ApplicationController
	def index
		@people = tblPerson.all
	end
end