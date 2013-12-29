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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130930041532) do

  create_table "data_files", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "fosterers", :force => true do |t|
    t.string   "motivation"
    t.boolean  "catnursing"
    t.boolean  "catfeeding"
    t.boolean  "catbottlefeed"
    t.boolean  "catinjured"
    t.boolean  "dognursing"
    t.boolean  "dogfeeding"
    t.boolean  "dogbottlefeed"
    t.boolean  "doginjured"
    t.boolean  "rabgui"
    t.boolean  "hedgehoginjured"
    t.boolean  "hedgehogbottle"
    t.boolean  "birdsinjured"
    t.boolean  "birdstoung"
    t.boolean  "livestock"
    t.string   "ownhome"
    t.string   "inspecting"
    t.string   "rooms"
    t.string   "roomwarm"
    t.string   "hutch"
    t.string   "rabbithutch"
    t.string   "aviary"
    t.string   "livestockfenced"
    t.text     "homedesc"
    t.integer  "numadulta"
    t.integer  "numchild"
    t.string   "ages"
    t.integer  "numhoursperday"
    t.string   "worktype"
    t.text     "secondperson"
    t.string   "allmembersagree"
    t.string   "bringcentre"
    t.text     "transportdesc"
    t.boolean  "agreement"
    t.integer  "volunteer_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "personal"
  end

  create_table "orientations", :force => true do |t|
    t.string   "presenter"
    t.datetime "datetime"
    t.integer  "participantMax"
    t.integer  "numCurrParticipant"
    t.integer  "duration"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "salt"
    t.string   "role"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "volcoordinators", :force => true do |t|
    t.string   "email_replyto"
    t.string   "application_email_header"
    t.string   "application_email_content"
    t.integer  "absence_tolerence"
    t.integer  "absence_period"
    t.string   "absence_email_header"
    t.string   "absence_email_content"
    t.integer  "user_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "volunteers", :force => true do |t|
    t.string   "role"
    t.string   "title"
    t.date     "dob"
    t.string   "firstname"
    t.string   "lastname"
    t.text     "address"
    t.string   "email"
    t.string   "mobile"
    t.string   "home"
    t.text     "background"
    t.boolean  "befosterer"
    t.date     "break_from"
    t.date     "break_to"
    t.integer  "scheduledjobtype_id"
    t.integer  "orientation_id"
    t.integer  "user_id"
    t.integer  "volscheduler_id"
    t.string   "status"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "volunteers", ["firstname"], :name => "index_volunteers_on_firstname"
  add_index "volunteers", ["orientation_id"], :name => "index_volunteers_on_orientation_id"

  create_table "whiteboards", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "volunteer_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "whiteboards", ["volunteer_id"], :name => "index_whiteboards_on_volunteer_id"

end
