# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_01_13_205455) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "ability", ["can_show_videos", "can_be_set_by_porn_bot", "can_be_set_by_lizard"]

  create_table "action_mailbox_inbound_emails", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.string "message_id", null: false
    t.string "message_checksum", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id", "message_checksum"], name: "index_action_mailbox_inbound_emails_uniqueness", unique: true
  end

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "ahoy_events", force: :cascade do |t|
    t.bigint "visit_id"
    t.bigint "user_id"
    t.string "name"
    t.text "properties"
    t.datetime "time"
    t.index ["name", "time"], name: "index_ahoy_events_on_name_and_time"
    t.index ["user_id"], name: "index_ahoy_events_on_user_id"
    t.index ["visit_id"], name: "index_ahoy_events_on_visit_id"
  end

  create_table "ahoy_visits", force: :cascade do |t|
    t.string "visit_token"
    t.string "visitor_token"
    t.bigint "user_id"
    t.string "ip"
    t.text "user_agent"
    t.text "referrer"
    t.string "referring_domain"
    t.text "landing_page"
    t.string "browser"
    t.string "os"
    t.string "device_type"
    t.string "country"
    t.string "region"
    t.string "city"
    t.float "latitude"
    t.float "longitude"
    t.string "utm_source"
    t.string "utm_medium"
    t.string "utm_term"
    t.string "utm_content"
    t.string "utm_campaign"
    t.string "app_version"
    t.string "os_version"
    t.string "platform"
    t.datetime "started_at"
    t.index ["user_id"], name: "index_ahoy_visits_on_user_id"
    t.index ["visit_token"], name: "index_ahoy_visits_on_visit_token", unique: true
  end

  create_table "banned_ips", force: :cascade do |t|
    t.string "ip_address"
    t.bigint "banned_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ip_address"], name: "index_banned_ips_on_ip_address"
  end

  create_table "blazer_audits", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "query_id"
    t.text "statement"
    t.string "data_source"
    t.datetime "created_at"
    t.index ["query_id"], name: "index_blazer_audits_on_query_id"
    t.index ["user_id"], name: "index_blazer_audits_on_user_id"
  end

  create_table "blazer_checks", force: :cascade do |t|
    t.bigint "creator_id"
    t.bigint "query_id"
    t.string "state"
    t.string "schedule"
    t.text "emails"
    t.text "slack_channels"
    t.string "check_type"
    t.text "message"
    t.datetime "last_run_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_blazer_checks_on_creator_id"
    t.index ["query_id"], name: "index_blazer_checks_on_query_id"
  end

  create_table "blazer_dashboard_queries", force: :cascade do |t|
    t.bigint "dashboard_id"
    t.bigint "query_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dashboard_id"], name: "index_blazer_dashboard_queries_on_dashboard_id"
    t.index ["query_id"], name: "index_blazer_dashboard_queries_on_query_id"
  end

  create_table "blazer_dashboards", force: :cascade do |t|
    t.bigint "creator_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_blazer_dashboards_on_creator_id"
  end

  create_table "blazer_queries", force: :cascade do |t|
    t.bigint "creator_id"
    t.string "name"
    t.text "description"
    t.text "statement"
    t.string "data_source"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_blazer_queries_on_creator_id"
  end

  create_table "cached_posts", force: :cascade do |t|
    t.bigint "post_id"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "link_id", null: false
    t.bigint "user_id", null: false
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id"], name: "index_comments_on_link_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "crono_jobs", force: :cascade do |t|
    t.string "job_id", null: false
    t.text "log"
    t.datetime "last_performed_at", precision: nil
    t.boolean "healthy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_crono_jobs_on_job_id", unique: true
  end

  create_table "friendships", force: :cascade do |t|
    t.bigint "sender_id", null: false
    t.bigint "receiver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "confirmed"
    t.index ["receiver_id"], name: "index_friendships_on_receiver_id"
    t.index ["sender_id", "receiver_id"], name: "index_friendships_on_sender_id_and_receiver_id", unique: true
    t.index ["sender_id"], name: "index_friendships_on_sender_id"
  end

  create_table "link_abilities", force: :cascade do |t|
    t.bigint "link_id", null: false
    t.enum "ability", null: false, enum_type: "ability"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id"], name: "index_link_abilities_on_link_id"
  end

  create_table "links", force: :cascade do |t|
    t.datetime "expires"
    t.bigint "user_id", null: false
    t.string "terms"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "blacklist"
    t.string "post_url"
    t.string "post_thumbnail_url"
    t.string "post_description"
    t.datetime "last_ping", precision: nil
    t.bigint "set_by_id"
    t.boolean "friends_only"
    t.string "last_ping_user_agent"
    t.boolean "never_expires", default: false
    t.string "theme"
    t.string "response_text"
    t.integer "response_type"
    t.bigint "ahoy_visit_id"
    t.integer "min_score"
    t.datetime "live_client_started_at", precision: nil
    t.string "custom_url"
    t.bigint "forked_from_id"
    t.string "wizard_page"
    t.index ["forked_from_id"], name: "index_links_on_forked_from_id"
    t.index ["user_id"], name: "index_links_on_user_id"
  end

  create_table "message_thread_participants", force: :cascade do |t|
    t.bigint "message_thread_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "message_threads", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "message_thread_id", null: false
    t.bigint "from_user_id", null: false
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "notification_type"
    t.string "text"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "nuttracker_orgasms", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.boolean "is_ruined"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_nuttracker_orgasms_on_user_id"
  end

  create_table "past_links", force: :cascade do |t|
    t.integer "user_id"
    t.string "post_url"
    t.string "post_thumbnail_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "link_id"
    t.bigint "set_by_id"
    t.bigint "ahoy_visit_id"
    t.index ["link_id"], name: "index_past_links_on_link_id"
    t.index ["set_by_id"], name: "index_past_links_on_set_by_id"
    t.index ["user_id"], name: "index_past_links_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "details"
    t.boolean "admin", default: false
    t.string "api_key", limit: 8
    t.integer "set_count", default: 0, null: false
    t.bigint "viewing_link_id"
    t.string "password_reset_token"
    t.string "mascot"
    t.boolean "pervert"
    t.boolean "quarantined", default: false
    t.index ["email"], name: "unique_emails", unique: true
    t.index ["set_count"], name: "index_users_on_set_count", order: :desc
    t.index ["username"], name: "unique_usernames", unique: true
    t.index ["viewing_link_id"], name: "index_users_on_viewing_link_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "banned_ips", "users", column: "banned_by_id"
  add_foreign_key "comments", "links"
  add_foreign_key "comments", "users"
  add_foreign_key "friendships", "users", column: "receiver_id"
  add_foreign_key "friendships", "users", column: "sender_id"
  add_foreign_key "link_abilities", "links"
  add_foreign_key "links", "links", column: "forked_from_id"
  add_foreign_key "links", "users"
  add_foreign_key "links", "users", column: "set_by_id"
  add_foreign_key "notifications", "users"
  add_foreign_key "nuttracker_orgasms", "users"
  add_foreign_key "past_links", "links", on_delete: :nullify
  add_foreign_key "past_links", "users"
  add_foreign_key "past_links", "users", column: "set_by_id"
  add_foreign_key "users", "links", column: "viewing_link_id"
end
