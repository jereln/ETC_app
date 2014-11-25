# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141122192052) do

  create_table "sysdiagrams", primary_key: "diagram_id", force: true do |t|
    t.string  "name",         limit: 128, null: false
    t.integer "principal_id",             null: false
    t.integer "version"
    t.binary  "definition"
  end

  add_index "sysdiagrams", ["principal_id", "name"], name: "UK_principal_name", unique: true

  create_table "tblClass", primary_key: "ClassID", force: true do |t|
    t.integer  "SeriesID"
    t.integer  "DayOfWeekID"
    t.datetime "StartTime"
    t.integer  "MaxStudents",          limit: 2
    t.decimal  "ClassFee"
    t.integer  "PersonID_Instructor1"
    t.integer  "PersonID_Instructor2"
    t.boolean  "NeedBallMachine",                 default: false, null: false
    t.text     "Notes"
    t.boolean  "IsActive",                        default: true,  null: false
    t.datetime "CreatedAt",                                       null: false
    t.string   "CreatedBy",            limit: 30
    t.datetime "ChangedAt"
    t.string   "ChangedBy",            limit: 30
  end

  create_table "tblClassCourt", primary_key: "ClassCourtID", force: true do |t|
    t.integer  "ClassID"
    t.integer  "CourtID"
    t.datetime "CreatedAt",            null: false
    t.string   "CreatedBy", limit: 30
    t.datetime "ChangedAt"
    t.string   "ChangedBy", limit: 30
  end

  create_table "tblClassStudent", primary_key: "ClassStudentID", force: true do |t|
    t.integer  "ClassID"
    t.integer  "PersonID"
    t.boolean  "IsPaid",               default: false, null: false
    t.datetime "CreatedAt",                            null: false
    t.string   "CreatedBy", limit: 30
    t.datetime "ChangedAt"
    t.string   "ChangedBy", limit: 30
  end

  create_table "tblClassWaitList", primary_key: "ClassWaitlistID", force: true do |t|
    t.integer  "ClassID"
    t.integer  "PersonID"
    t.text     "Notes"
    t.datetime "CreatedAt",            null: false
    t.string   "CreatedBy", limit: 30
    t.datetime "ChangedAt"
    t.string   "ChangedBy", limit: 30
  end

  create_table "tblCommon", primary_key: "ID", force: true do |t|
    t.integer  "SeniorAge"
    t.decimal  "SeniorDiscount"
    t.datetime "SeniorTime"
    t.integer  "BallMachineCount"
    t.decimal  "BallMachineCost"
    t.datetime "FirstCourtTime"
    t.datetime "LastCourtTime"
    t.decimal  "BallBasketCost"
    t.decimal  "BallCanCost"
    t.decimal  "WarmupCourtCost"
    t.float    "SalesTaxRate",     limit: 53
    t.string   "MerchantID",       limit: 20
    t.string   "RegKey",           limit: 20
  end

  create_table "tblCourt", primary_key: "CourtID", force: true do |t|
    t.string   "CourtName",        limit: 20
    t.integer  "CourtSizeID"
    t.boolean  "IsSinglesOnly",               default: false, null: false
    t.boolean  "AllowBallMachine",            default: false, null: false
    t.datetime "FirstPublicTime"
    t.datetime "CreatedAt",                                   null: false
    t.string   "CreatedBy",        limit: 30
    t.datetime "ChangedAt"
    t.string   "ChangedBy",        limit: 30
  end

  create_table "tblCourtRate", primary_key: "CourtRateID", force: true do |t|
    t.integer  "CourtSizeID"
    t.integer  "CourtUseID"
    t.datetime "EffectiveDate"
    t.decimal  "RateMinimum"
    t.decimal  "Rate75Min"
    t.decimal  "Rate90Min"
    t.decimal  "Rate75MinPerPerson"
    t.decimal  "Rate90MinPerPerson"
    t.decimal  "RateSpecial"
    t.datetime "CreatedAt",                     null: false
    t.string   "CreatedBy",          limit: 30
    t.datetime "ChangedAt"
    t.string   "ChangedBy",          limit: 30
  end

  create_table "tblCourtSchedule", primary_key: "CourtScheduleID", force: true do |t|
    t.integer  "CourtID"
    t.date     "PeriodDate"
    t.time     "PeriodTime"
    t.integer  "ReservationID"
    t.datetime "CreatedAt",                null: false
    t.string   "CreatedBy",     limit: 30
    t.datetime "ChangedAt"
    t.string   "ChangedBy",     limit: 30
  end

  create_table "tblCreditCard", primary_key: "CreditCardID", force: true do |t|
    t.integer  "PersonID"
    t.integer  "IssuerID"
    t.binary   "CCNumber",       limit: 32
    t.string   "NameOnCard",     limit: 30
    t.integer  "ExpMonth",       limit: 2
    t.integer  "ExpYear",        limit: 2
    t.string   "BillingAddress", limit: 50
    t.string   "BillingCity",    limit: 20
    t.string   "BillingState",   limit: 2
    t.string   "BillingZipCode", limit: 15
    t.boolean  "HasBeenUsed",               default: false, null: false
    t.datetime "CreatedAt",                                 null: false
    t.string   "CreatedBy",      limit: 30
    t.datetime "ChangedAt"
    t.string   "ChangedBy",      limit: 30
  end

  create_table "tblCreditCardFee", primary_key: "ID", force: true do |t|
    t.datetime "EffectiveDate"
    t.decimal  "Fee"
    t.datetime "CreatedAt",                null: false
    t.string   "CreatedBy",     limit: 30
    t.datetime "ChangedAt"
    t.string   "ChangedBy",     limit: 30
  end

  create_table "tblDropIn", primary_key: "DropInID", force: true do |t|
    t.integer  "LessonID"
    t.integer  "PersonID"
    t.datetime "CreatedAt",            null: false
    t.string   "CreatedBy", limit: 30
    t.datetime "ChangedAt"
    t.string   "ChangedBy", limit: 30
  end

  create_table "tblEmailList", primary_key: "EmailListID", force: true do |t|
    t.string   "Description", limit: 50
    t.datetime "CreatedAt",              null: false
    t.string   "CreatedBy",   limit: 30
    t.datetime "ChangedAt"
    t.string   "ChangedBy",   limit: 30
  end

  create_table "tblFamily", primary_key: "FamilyID", force: true do |t|
    t.string   "FamilyName", limit: 50
    t.datetime "CreatedAt",             null: false
    t.string   "CreatedBy",  limit: 30
    t.datetime "ChangedAt"
    t.string   "ChangedBy",  limit: 30
  end

  create_table "tblLesson", primary_key: "LessonID", force: true do |t|
    t.integer  "ClassID"
    t.datetime "LessonDateTime"
    t.integer  "PersonID_Instructor1"
    t.integer  "PersonID_Instructor2"
    t.datetime "CreatedAt",                       null: false
    t.string   "CreatedBy",            limit: 30
    t.datetime "ChangedAt"
    t.string   "ChangedBy",            limit: 30
  end

  create_table "tblLessonAttendance", primary_key: "LessonAttendanceID", force: true do |t|
    t.integer  "LessonID"
    t.integer  "PersonID"
    t.datetime "CreatedAt",            null: false
    t.string   "CreatedBy", limit: 30
    t.datetime "ChangedAt"
    t.string   "ChangedBy", limit: 30
  end

  create_table "tblPendingSale", primary_key: "PendingSaleID", force: true do |t|
    t.integer  "ReservationID"
    t.integer  "PersonID"
    t.integer  "PersonID_For"
    t.integer  "PersonID_ExpectedPayer"
    t.datetime "CreatedAt",                         null: false
    t.string   "CreatedBy",              limit: 30
    t.datetime "ChangedAt"
    t.string   "ChangedBy",              limit: 30
  end

  create_table "tblPendingSaleItem", primary_key: "PendingSaleItemID", force: true do |t|
    t.integer  "PendingSaleID"
    t.integer  "ItemTypeID"
    t.decimal  "UnitPrice"
    t.integer  "Units"
    t.decimal  "SaleAmount"
    t.decimal  "PromoAmount"
    t.string   "Description",      limit: 50
    t.boolean  "IsTaxable",                   default: false, null: false
    t.boolean  "IsPay",                       default: false, null: false
    t.integer  "PersonID_Scholar"
    t.boolean  "IsUserAdded",                 default: false, null: false
    t.datetime "CreatedAt",                                   null: false
    t.string   "CreatedBy",        limit: 30
    t.datetime "ChangedAt"
    t.string   "ChangedBy",        limit: 30
  end

  create_table "tblPerson", primary_key: "PersonID", force: true do |t|
    t.string   "FirstName",              limit: 20
    t.string   "LastName",               limit: 20
    t.string   "FullName",               limit: 41
    t.string   "FullNameRev",            limit: 42
    t.string   "Gender",                 limit: 1
    t.datetime "BirthDate"
    t.string   "Address",                limit: 50
    t.string   "City",                   limit: 20
    t.string   "State",                  limit: 2
    t.string   "ZipCode",                limit: 15
    t.boolean  "AddressUsePrimary",                  default: false, null: false
    t.string   "HomePhone",              limit: 20
    t.boolean  "HomePhoneUsePrimary",                default: false, null: false
    t.string   "WorkPhone",              limit: 20
    t.string   "CellPhone",              limit: 20
    t.string   "Email",                  limit: 100
    t.boolean  "WantPromoEmail",                     default: true,  null: false
    t.boolean  "AdultEmailList",                     default: true,  null: false
    t.boolean  "JuniorEmailList",                    default: false, null: false
    t.integer  "AbilityID_UTSA"
    t.integer  "AbilityID_ETC"
    t.integer  "AbilityID_Self"
    t.string   "LoginID",                limit: 30
    t.binary   "LoginPassword",          limit: 32
    t.string   "SecurityGroup",          limit: 10
    t.boolean  "DoNotShowReservations",              default: false, null: false
    t.decimal  "RateHourly"
    t.decimal  "RateHalfHour"
    t.decimal  "RateExtraStudent"
    t.boolean  "IsActive",                           default: true,  null: false
    t.decimal  "PrePaidBalance"
    t.integer  "PersonID_UsualPayer"
    t.text     "Notes"
    t.datetime "CreatedAt",                                          null: false
    t.string   "CreatedBy",              limit: 30
    t.datetime "ChangedAt"
    t.string   "ChangedBy",              limit: 30
    t.string   "encrypted_password",                 default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  create_table "tblPersonNote", primary_key: "NoteID", force: true do |t|
    t.integer  "PersonID"
    t.text     "Note"
    t.datetime "CreatedAt",            null: false
    t.string   "CreatedBy", limit: 30
    t.datetime "ChangedAt"
    t.string   "ChangedBy", limit: 30
  end

  create_table "tblPrePaidTransaction", primary_key: "PrePaidTransactionID", force: true do |t|
    t.integer  "PersonID"
    t.decimal  "TransactionAmount"
    t.boolean  "IsPromo",                      default: false, null: false
    t.integer  "SaleID"
    t.datetime "CreatedAt",                                    null: false
    t.string   "CreatedBy",         limit: 30
    t.datetime "ChangedAt"
    t.string   "ChangedBy",         limit: 30
  end

  create_table "tblReservation", primary_key: "ReservationID", force: true do |t|
    t.integer  "PersonID"
    t.integer  "PersonID_Student"
    t.integer  "PersonID_ExpectedPayer"
    t.integer  "ClassID"
    t.integer  "CourtID"
    t.integer  "CourtUseID"
    t.datetime "StartDateTime"
    t.datetime "EndDateTime"
    t.boolean  "UseStandardPeriod",                 default: true,  null: false
    t.integer  "StudentCount"
    t.integer  "SeniorCount"
    t.boolean  "IsCanceled",                        default: false, null: false
    t.boolean  "BasketOfBalls",                     default: false, null: false
    t.integer  "BallCanCount"
    t.integer  "ReservationID_WarmUp"
    t.decimal  "CourtUseCost"
    t.decimal  "InstructorCost"
    t.decimal  "BallMachineCost"
    t.decimal  "BasketOfBallsCost"
    t.decimal  "BallCanCost"
    t.decimal  "WarmUpCost"
    t.decimal  "SeniorDiscount"
    t.decimal  "CreditDiscount"
    t.decimal  "TotalCost"
    t.text     "Notes"
    t.boolean  "IsPaid",                            default: false, null: false
    t.integer  "ReservationRecurID"
    t.datetime "CreatedAt",                                         null: false
    t.string   "CreatedBy",              limit: 30
    t.datetime "ChangedAt"
    t.string   "ChangedBy",              limit: 30
  end

  add_index "tblReservation", ["ReservationRecurID"], name: "IX_tblReservation"

  create_table "tblReservationPlayer", primary_key: "ReservationPlayerID", force: true do |t|
    t.integer  "ReservationID"
    t.integer  "PersonID_Player"
    t.datetime "CreatedAt",                  null: false
    t.string   "CreatedBy",       limit: 30
    t.datetime "ChangedAt"
    t.string   "ChangedBy",       limit: 30
  end

  create_table "tblReservationRecur", primary_key: "ReservationRecurID", force: true do |t|
    t.integer  "PersonID"
    t.integer  "CreditCardID"
    t.integer  "DayOfWeekID"
    t.datetime "StartTime"
    t.datetime "EndTime"
    t.integer  "CourtID"
    t.integer  "CourtUseID"
    t.datetime "ReservationStartDate"
    t.datetime "ReservationEndDate"
    t.datetime "CreatedAt",                       null: false
    t.string   "CreatedBy",            limit: 30
    t.datetime "ChangedAt"
    t.string   "ChangedBy",            limit: 30
  end

  create_table "tblReservationWaitlist", primary_key: "ReservationWaitlistID", force: true do |t|
    t.integer  "PersonID"
    t.integer  "CourtSizeID"
    t.datetime "StartDateTime"
    t.datetime "EndDateTime"
    t.text     "Notes"
    t.datetime "CreatedAt",                             null: false
    t.string   "CreatedBy",     limit: 30, default: "", null: false
    t.datetime "ChangedAt"
    t.string   "ChangedBy",     limit: 30
  end

  create_table "tblSale", primary_key: "SaleID", force: true do |t|
    t.datetime "TransactionDate"
    t.integer  "PersonID_Payer"
    t.decimal  "TotalAmount"
    t.string   "PaymentMethod",     limit: 4
    t.integer  "CreditCardID"
    t.string   "CreditCardLast4",   limit: 4
    t.string   "TransactionNumber", limit: 20
    t.string   "AuthCode",          limit: 25
    t.datetime "CreatedAt",                    null: false
    t.string   "CreatedBy",         limit: 30
    t.datetime "ChangedAt"
    t.string   "ChangedBy",         limit: 30
  end

  create_table "tblSaleItem", primary_key: "SaleItemID", force: true do |t|
    t.integer  "SaleID"
    t.integer  "ReservationID"
    t.integer  "PersonID"
    t.integer  "PersonID_For"
    t.integer  "ItemTypeID"
    t.decimal  "UnitPrice"
    t.integer  "Units"
    t.decimal  "SaleAmount"
    t.decimal  "PromoAmount"
    t.string   "Description",      limit: 50
    t.boolean  "IsTaxable",                   default: false, null: false
    t.integer  "PersonID_Scholar"
    t.datetime "CreatedAt",                                   null: false
    t.string   "CreatedBy",        limit: 30
    t.datetime "ChangedAt"
    t.string   "ChangedBy",        limit: 30
  end

  create_table "tblSalePayerOld", primary_key: "SalePayerID", force: true do |t|
    t.integer  "SaleID"
    t.integer  "PersonID_Payer"
    t.decimal  "TotalAmount"
    t.string   "PaymentMethod",     limit: 4
    t.integer  "CreditCardID"
    t.string   "CreditCardLast4",   limit: 4
    t.string   "TransactionNumber", limit: 20
    t.string   "AuthCode",          limit: 20
    t.datetime "CreatedAt",                    null: false
    t.string   "CreatedBy",         limit: 30
    t.datetime "ChangedAt"
    t.string   "ChangedBy",         limit: 30
  end

  create_table "tblSaleReservationItemOld", primary_key: "SaleReservationItemID", force: true do |t|
    t.integer  "SaleReservationID"
    t.integer  "ItemTypeID"
    t.decimal  "UnitPrice"
    t.integer  "Units"
    t.decimal  "SaleAmount"
    t.decimal  "PromoAmount"
    t.string   "Description",       limit: 50
    t.boolean  "IsTaxable",                    default: false, null: false
    t.integer  "PersonID_PaidBy"
    t.datetime "CreatedAt",                                    null: false
    t.string   "CreatedBy",         limit: 30
    t.datetime "ChangedAt"
    t.string   "ChangedBy",         limit: 30
  end

  create_table "tblSaleReservationOld", primary_key: "SaleReservationID", force: true do |t|
    t.integer "SaleID"
    t.integer "ReservationID"
    t.integer "PersonID"
  end

  create_table "tblSeries", primary_key: "SeriesID", force: true do |t|
    t.integer  "SessionID"
    t.string   "Title",                limit: 50
    t.integer  "MaxStudents",          limit: 2
    t.decimal  "ClassFee"
    t.boolean  "AllowDropIns",                    default: false, null: false
    t.decimal  "DropInFee"
    t.integer  "PersonID_Instructor"
    t.integer  "DurationMinutes",      limit: 2
    t.integer  "AbilityID"
    t.boolean  "IncludeInInstRevenue",            default: false, null: false
    t.datetime "CreatedAt",                                       null: false
    t.string   "CreatedBy",            limit: 30
    t.datetime "ChangedAt"
    t.string   "ChangedBy",            limit: 30
  end

  create_table "tblSession", primary_key: "SessionID", force: true do |t|
    t.string   "Title",     limit: 50
    t.datetime "StartDate"
    t.datetime "EndDate"
    t.boolean  "IsAdult",              default: false, null: false
    t.datetime "CreatedAt",                            null: false
    t.string   "CreatedBy", limit: 30
    t.datetime "ChangedAt"
    t.string   "ChangedBy", limit: 30
  end

  create_table "tblTeachingRate", primary_key: "TeachingRateID", force: true do |t|
    t.integer  "PersonID"
    t.datetime "EffectiveDate"
    t.decimal  "Rate30Min"
    t.decimal  "Rate60Min"
    t.decimal  "ExtraStudentRate"
    t.datetime "CreatedAt",                   null: false
    t.string   "CreatedBy",        limit: 30
    t.datetime "ChangedAt"
    t.string   "ChangedBy",        limit: 30
  end

  create_table "tlkpAbility", primary_key: "AbilityID", force: true do |t|
    t.string   "Description", limit: 50
    t.boolean  "IsAdult",                default: true, null: false
    t.integer  "SortOrder",   limit: 2
    t.datetime "CreatedAt",                             null: false
    t.string   "CreatedBy",   limit: 30
    t.datetime "ChangedAt"
    t.string   "ChangedBy",   limit: 30
  end

  create_table "tlkpCourtSize", primary_key: "CourtSizeID", force: true do |t|
    t.string "Description", limit: 20
  end

  create_table "tlkpCourtUse", primary_key: "CourtUseID", force: true do |t|
    t.string   "Description",      limit: 50
    t.boolean  "PayPerOccurrence",            default: false, null: false
    t.integer  "SortOrder"
    t.datetime "CreatedAt",                                   null: false
    t.string   "CreatedBy",        limit: 30
    t.datetime "ChangedAt"
    t.string   "ChangedBy",        limit: 30
  end

  create_table "tlkpDayOfWeek", primary_key: "DayOfWeekID", force: true do |t|
    t.string "DayOfWeek", limit: 10
  end

  create_table "tlkpHoliday", primary_key: "HolDate", force: true do |t|
    t.string   "Holiday",       limit: 50
    t.boolean  "IsClosed",                 default: false, null: false
    t.boolean  "IsOpenNoClass",            default: false, null: false
    t.datetime "CreatedAt",                                null: false
    t.string   "CreatedBy",     limit: 30
    t.datetime "ChangedAt"
    t.string   "ChangedBy",     limit: 30
  end

  create_table "tlkpIssuer", primary_key: "IssuerID", force: true do |t|
    t.string   "IssuerName", limit: 20
    t.datetime "CreatedAt",             null: false
    t.string   "CreatedBy",  limit: 30
    t.datetime "ChangedAt"
    t.string   "ChangedBy",  limit: 30
  end

  create_table "tlkpItemType", primary_key: "ItemTypeID", force: true do |t|
    t.string  "Description",    limit: 50
    t.boolean "AllowUserEntry",            default: false, null: false
    t.integer "SortOrder"
  end

  create_table "tlkpPaymentMethod", primary_key: "PaymentMethod", force: true do |t|
    t.string "Description", limit: 35
  end

  create_table "tlkpSecurityGroup", primary_key: "SecurityGroup", force: true do |t|
    t.string   "Description",      limit: 30
    t.integer  "SchedAdvanceDays"
    t.datetime "CreatedAt",                   null: false
    t.string   "CreatedBy",        limit: 30
    t.datetime "ChangedAt"
    t.string   "ChangedBy",        limit: 30
  end

  create_table "trelFamilyPerson", primary_key: "FamilyID", force: true do |t|
    t.integer  "PersonID",                                     null: false
    t.boolean  "IsPrimary",                    default: false, null: false
    t.boolean  "AllowUseCC",                   default: true,  null: false
    t.boolean  "AllowReserveCourt",            default: true,  null: false
    t.datetime "CreatedAt",                                    null: false
    t.string   "CreatedBy",         limit: 30
    t.datetime "ChangedAt"
    t.string   "ChangedBy",         limit: 30
  end

  create_table "trelPersonEmail", primary_key: "PersonEmailID", force: true do |t|
    t.integer  "PersonID"
    t.integer  "EmailListID"
    t.datetime "CreatedAt",              null: false
    t.string   "CreatedBy",   limit: 30
    t.datetime "ChangedAt"
    t.string   "ChangedBy",   limit: 30
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
