class Schedule < ActiveRecord::Base
  self.table_name = 'tblSchedule'

  has_many :reservations
  has_many :people, through: :reservations

  alias_attribute :period_date, :PeriodDate
  alias_attribute :period_time, :PeriodTime
end
