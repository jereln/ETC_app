class Reservation < ActiveRecord::Base
  self.table_name = 'tblReservation'

  belongs_to :schedule
  belongs_to :person

  alias_attribute :period_date, :PeriodDate
  alias_attribute :period_time, :PeriodTime
end
