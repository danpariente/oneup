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

ActiveRecord::Schema.define(:version => 20120820001607) do

  create_table "active_admin_comments", :force => true do |t|
    t.integer  "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "activities", :force => true do |t|
    t.string   "activity_type"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "addresses", :force => true do |t|
    t.integer  "profile_id"
    t.string   "address_type"
    t.string   "address"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "addresses", ["profile_id"], :name => "index_addresses_on_profile_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "albums", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "annotations", :force => true do |t|
    t.text     "description"
    t.integer  "x"
    t.integer  "y"
    t.integer  "height"
    t.integer  "width"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "applications", :force => true do |t|
    t.text     "objective"
    t.integer  "min_salary"
    t.integer  "max_salary"
    t.string   "availability"
    t.integer  "job_id"
    t.integer  "user_id"
    t.string   "status"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "applications", ["job_id"], :name => "index_applications_on_job_id"
  add_index "applications", ["user_id"], :name => "index_applications_on_user_id"

  create_table "applications_competencies", :id => false, :force => true do |t|
    t.integer "application_id"
    t.integer "competency_id"
  end

  add_index "applications_competencies", ["application_id"], :name => "index_applications_competencies_on_application_id"
  add_index "applications_competencies", ["competency_id"], :name => "index_applications_competencies_on_competency_id"

  create_table "applications_educations", :id => false, :force => true do |t|
    t.integer "application_id"
    t.integer "education_id"
  end

  add_index "applications_educations", ["application_id"], :name => "index_applications_educations_on_application_id"
  add_index "applications_educations", ["education_id"], :name => "index_applications_educations_on_education_id"

  create_table "applications_experiences", :id => false, :force => true do |t|
    t.integer "application_id"
    t.integer "experience_id"
  end

  add_index "applications_experiences", ["application_id"], :name => "index_applications_experiences_on_application_id"
  add_index "applications_experiences", ["experience_id"], :name => "index_applications_experiences_on_experience_id"

  create_table "applications_languages", :id => false, :force => true do |t|
    t.integer "application_id"
    t.integer "language_id"
  end

  add_index "applications_languages", ["application_id"], :name => "index_applications_languages_on_application_id"
  add_index "applications_languages", ["language_id"], :name => "index_applications_languages_on_language_id"

  create_table "applications_publications", :id => false, :force => true do |t|
    t.integer "application_id"
    t.integer "publication_id"
  end

  add_index "applications_publications", ["application_id"], :name => "index_applications_publications_on_application_id"
  add_index "applications_publications", ["publication_id"], :name => "index_applications_publications_on_publication_id"

  create_table "applications_references", :id => false, :force => true do |t|
    t.integer "application_id"
    t.integer "reference_id"
  end

  add_index "applications_references", ["application_id"], :name => "index_applications_references_on_application_id"
  add_index "applications_references", ["reference_id"], :name => "index_applications_references_on_reference_id"

  create_table "avatars", :force => true do |t|
    t.integer  "user_id"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.boolean  "active",            :default => true
  end

  add_index "avatars", ["user_id"], :name => "index_avatars_on_user_id"

  create_table "blocks", :force => true do |t|
    t.integer  "user_id"
    t.integer  "job_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "blocks", ["job_id"], :name => "index_blocks_on_job_id"
  add_index "blocks", ["user_id"], :name => "index_blocks_on_user_id"

  create_table "bridges", :force => true do |t|
    t.integer  "event_id"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
  end

  create_table "competencies", :force => true do |t|
    t.string   "name"
    t.string   "rating"
    t.text     "description"
    t.integer  "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "application_id"
  end

  create_table "confirms", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "event_id"
  end

  create_table "declines", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "event_id"
  end

  create_table "educations", :force => true do |t|
    t.string   "country"
    t.string   "education_level"
    t.string   "field_of_study"
    t.string   "institution"
    t.date     "attended_from"
    t.date     "attended_to"
    t.text     "add_notes"
    t.integer  "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "application_id"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "venue"
    t.datetime "event_date"
    t.time     "event_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "wall_id"
    t.string   "invites"
    t.string   "attendance"
  end

  create_table "experiences", :force => true do |t|
    t.string   "company_name"
    t.string   "country"
    t.string   "industry"
    t.date     "hired_from"
    t.date     "hired_to"
    t.string   "job_title"
    t.text     "responsability"
    t.text     "reason_leaving"
    t.string   "salary"
    t.text     "add_notes"
    t.integer  "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "application_id"
  end

  create_table "friendships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "wall_id"
  end

  create_table "identifiers", :force => true do |t|
    t.integer  "profile_id"
    t.string   "identifier_type"
    t.string   "identifier"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "identifiers", ["profile_id"], :name => "index_identifiers_on_profile_id"

  create_table "interviews", :force => true do |t|
    t.string   "mode"
    t.date     "date"
    t.time     "time"
    t.text     "notes"
    t.integer  "job_id"
    t.integer  "user_id"
    t.integer  "application_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "interviewed_id"
  end

  add_index "interviews", ["application_id"], :name => "index_interviews_on_application_id"
  add_index "interviews", ["job_id"], :name => "index_interviews_on_job_id"
  add_index "interviews", ["user_id"], :name => "index_interviews_on_user_id"

  create_table "jobs", :force => true do |t|
    t.string   "job_title"
    t.string   "job_type"
    t.string   "job_category"
    t.string   "working_location"
    t.text     "responsability"
    t.string   "lowest_education_level"
    t.string   "highest_education_level"
    t.integer  "age_min"
    t.integer  "age_max"
    t.string   "salary_min"
    t.string   "salary_max"
    t.boolean  "negotiable"
    t.boolean  "travel"
    t.boolean  "relocate"
    t.integer  "user_id"
    t.integer  "company_id"
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages", :force => true do |t|
    t.string   "language"
    t.string   "level"
    t.integer  "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "application_id"
  end

  create_table "likes", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "likeable_id"
    t.string   "likeable_type"
    t.integer  "user_id"
    t.string   "author"
  end

  create_table "memberships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "member_id"
  end

  create_table "mentions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "status_id"
  end

  create_table "messages", :force => true do |t|
    t.string   "topic"
    t.text     "body"
    t.integer  "received_messageable_id"
    t.string   "received_messageable_type"
    t.integer  "sent_messageable_id"
    t.string   "sent_messageable_type"
    t.boolean  "opened",                     :default => false
    t.boolean  "recipient_delete",           :default => false
    t.boolean  "sender_delete",              :default => false
    t.boolean  "recipient_permanent_delete", :default => false
    t.boolean  "sender_permanent_delete",    :default => false
    t.boolean  "r_hidden"
    t.boolean  "s_hidden"
    t.string   "recipient"
    t.integer  "recipient_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
  end

  add_index "messages", ["ancestry"], :name => "index_messages_on_ancestry"

  create_table "messengers", :force => true do |t|
    t.integer  "profile_id"
    t.string   "im_type"
    t.string   "account_name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "messengers", ["profile_id"], :name => "index_messengers_on_profile_id"

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "permalink"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "event_id"
    t.integer  "group_id"
    t.integer  "pageable_id"
    t.string   "pageable_type"
  end

  create_table "pendings", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "event_id"
  end

  create_table "people", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.string   "title"
    t.string   "caption"
    t.string   "privacy",    :default => "public"
    t.string   "format"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "wall_id"
  end

  create_table "preferences", :force => true do |t|
    t.text     "job_titles"
    t.string   "job_type"
    t.string   "job_categories"
    t.string   "expected_salary"
    t.boolean  "able_to_travel"
    t.boolean  "able_to_relocate"
    t.string   "preferred_location"
    t.boolean  "shift"
    t.integer  "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "private_messages", :force => true do |t|
    t.string   "topic"
    t.text     "body"
    t.integer  "received_messageable_id"
    t.string   "received_messageable_type"
    t.integer  "sent_messageable_id"
    t.string   "sent_messageable_type"
    t.boolean  "opened",                     :default => false
    t.boolean  "recipient_delete",           :default => false
    t.boolean  "sender_delete",              :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
    t.boolean  "recipient_permanent_delete", :default => false
    t.boolean  "sender_permanent_delete",    :default => false
    t.boolean  "r_hidden"
    t.boolean  "s_hidden"
    t.string   "recipient"
    t.integer  "recipient_id"
    t.integer  "user_id"
  end

  add_index "private_messages", ["ancestry"], :name => "index_private_messages_on_ancestry"
  add_index "private_messages", ["sent_messageable_id", "received_messageable_id"], :name => "acts_as_messageable_ids"

  create_table "profiles", :force => true do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "date_birth"
    t.string   "gender"
    t.string   "marital_status"
    t.string   "current_drawn"
    t.string   "availability"
    t.string   "mobile_number"
    t.string   "home_number"
    t.string   "work_number"
    t.string   "education_level"
    t.text     "skills"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nationality"
    t.string   "work_pass_visa"
    t.string   "race"
  end

  create_table "publications", :force => true do |t|
    t.string   "publication_type"
    t.string   "title"
    t.string   "website"
    t.text     "description"
    t.date     "publication_date"
    t.integer  "profile_id"
    t.integer  "application_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "publications", ["application_id"], :name => "index_publications_on_application_id"
  add_index "publications", ["profile_id"], :name => "index_publications_on_profile_id"

  create_table "references", :force => true do |t|
    t.string   "name"
    t.string   "relationship"
    t.string   "email"
    t.string   "phone_number"
    t.string   "company_name"
    t.string   "job_title"
    t.integer  "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "application_id"
  end

  create_table "relationships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "follower_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "replies", :force => true do |t|
    t.text     "body"
    t.integer  "author_id"
    t.integer  "message_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requests", :force => true do |t|
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "from_id"
  end

  create_table "searches", :force => true do |t|
    t.string   "keywords"
    t.string   "category"
    t.decimal  "min_sal"
    t.decimal  "max_sal"
    t.string   "job_type"
    t.string   "level"
    t.string   "location"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "statuses", :force => true do |t|
    t.string   "text",         :limit => 160
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "recipient_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "role"
    t.string   "formatted_name"
    t.string   "sex"
    t.string   "relationship_status"
    t.string   "provider"
    t.string   "identifier"
    t.string   "photo_url"
    t.string   "location"
    t.string   "description"
    t.text     "interests"
    t.text     "education"
    t.integer  "wall_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company_name"
    t.string   "industry"
    t.integer  "mobile_number"
    t.integer  "work_number"
    t.integer  "registration_number"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "walls", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "watches", :force => true do |t|
    t.integer  "user_id"
    t.integer  "job_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "watches", ["job_id"], :name => "index_watches_on_job_id"
  add_index "watches", ["user_id"], :name => "index_watches_on_user_id"

  create_table "websites", :force => true do |t|
    t.integer  "profile_id"
    t.string   "website_type"
    t.string   "url"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "websites", ["profile_id"], :name => "index_websites_on_profile_id"

end
