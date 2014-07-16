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

ActiveRecord::Schema.define(version: 20140715221717) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"
  enable_extension "pg_trgm"

  create_table "addresses", force: true do |t|
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.integer  "zip_code"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "addressable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "addressable_type"
  end

  add_index "addresses", ["addressable_id"], name: "index_addresses_on_addressable_id", using: :btree

  create_table "anime", force: true do |t|
    t.string   "title"
    t.string   "alt_title"
    t.string   "slug"
    t.string   "age_rating"
    t.integer  "episode_count"
    t.integer  "episode_length"
    t.text     "synopsis",                  default: "",    null: false
    t.string   "youtube_video_id"
    t.integer  "mal_id"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "cover_image_file_name"
    t.string   "cover_image_content_type"
    t.integer  "cover_image_file_size"
    t.datetime "cover_image_updated_at"
    t.float    "bayesian_average",          default: 0.0,   null: false
    t.integer  "user_count",                default: 0,     null: false
    t.string   "thetvdb_series_id"
    t.string   "thetvdb_season_id"
    t.boolean  "english_canonical",         default: false
    t.string   "age_rating_guide"
    t.string   "show_type"
    t.date     "started_airing_date"
    t.date     "finished_airing_date"
    t.hstore   "rating_frequencies",        default: {},    null: false
    t.string   "poster_image_file_name"
    t.string   "poster_image_content_type"
    t.integer  "poster_image_file_size"
    t.datetime "poster_image_updated_at"
    t.integer  "cover_image_top_offset",    default: 0,     null: false
    t.integer  "ann_id"
    t.boolean  "started_airing_date_known", default: true,  null: false
  end

  add_index "anime", ["age_rating"], name: "index_anime_on_age_rating", using: :btree
  add_index "anime", ["bayesian_average"], name: "index_anime_on_wilson_ci", order: {"bayesian_average"=>:desc}, using: :btree
  add_index "anime", ["mal_id"], name: "index_anime_on_mal_id", unique: true, using: :btree
  add_index "anime", ["slug"], name: "index_anime_on_slug", unique: true, using: :btree

  create_table "anime_franchises", id: false, force: true do |t|
    t.integer "anime_id"
    t.integer "franchise_id"
  end

  add_index "anime_franchises", ["anime_id"], name: "index_anime_franchises_on_anime_id", using: :btree
  add_index "anime_franchises", ["franchise_id"], name: "index_anime_franchises_on_franchise_id", using: :btree

  create_table "anime_genres", id: false, force: true do |t|
    t.integer "anime_id", null: false
    t.integer "genre_id", null: false
  end

  add_index "anime_genres", ["anime_id"], name: "index_anime_genres_on_anime_id", using: :btree
  add_index "anime_genres", ["genre_id"], name: "index_anime_genres_on_genre_id", using: :btree

  create_table "anime_producers", id: false, force: true do |t|
    t.integer "anime_id",    null: false
    t.integer "producer_id", null: false
  end

  add_index "anime_producers", ["anime_id"], name: "index_anime_producers_on_anime_id", using: :btree
  add_index "anime_producers", ["producer_id"], name: "index_anime_producers_on_producer_id", using: :btree

  create_table "beta_invites", force: true do |t|
    t.string   "email"
    t.string   "token"
    t.boolean  "invited",         default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "subscribed",      default: true
    t.string   "encrypted_email"
  end

  create_table "castings", force: true do |t|
    t.integer  "castable_id"
    t.integer  "person_id"
    t.integer  "character_id"
    t.string   "role"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.boolean  "voice_actor"
    t.boolean  "featured"
    t.integer  "order"
    t.string   "language"
    t.string   "castable_type"
  end

  add_index "castings", ["castable_id", "castable_type"], name: "index_castings_on_castable_id_and_castable_type", using: :btree
  add_index "castings", ["character_id"], name: "index_castings_on_character_id", using: :btree
  add_index "castings", ["person_id"], name: "index_castings_on_person_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "categorizations_count", default: 0
  end

  create_table "categories_restaurants", id: false, force: true do |t|
    t.integer "category_id"
    t.integer "restaurant_id"
  end

  add_index "categories_restaurants", ["category_id"], name: "index_categories_restaurants_on_category_id", using: :btree
  add_index "categories_restaurants", ["restaurant_id"], name: "index_categories_restaurants_on_restaurant_id", using: :btree

  create_table "categorizations", force: true do |t|
    t.integer  "category_id"
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categorizations", ["category_id"], name: "index_categorizations_on_category_id", using: :btree
  add_index "categorizations", ["restaurant_id"], name: "index_categorizations_on_restaurant_id", using: :btree

  create_table "characters", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "mal_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "characters", ["mal_id"], name: "character_mal_id", unique: true, using: :btree
  add_index "characters", ["mal_id"], name: "index_characters_on_mal_id", unique: true, using: :btree

  create_table "episodes", force: true do |t|
    t.integer  "anime_id"
    t.integer  "number"
    t.string   "title"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "season_number"
  end

  add_index "episodes", ["anime_id"], name: "index_episodes_on_anime_id", using: :btree

  create_table "favorite_genres_users", id: false, force: true do |t|
    t.integer "genre_id"
    t.integer "user_id"
  end

  add_index "favorite_genres_users", ["genre_id", "user_id"], name: "index_favorite_genres_users_on_genre_id_and_user_id", unique: true, using: :btree

  create_table "favorites", force: true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.string   "item_type"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "fav_rank",   default: 9999
  end

  add_index "favorites", ["fav_rank"], name: "index_favorites_on_fav_rank", using: :btree
  add_index "favorites", ["item_id", "item_type"], name: "index_favorites_on_item_id_and_item_type", using: :btree
  add_index "favorites", ["user_id", "item_id", "item_type"], name: "index_favorites_on_user_id_and_item_id_and_item_type", unique: true, using: :btree
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id", using: :btree

  create_table "follows", force: true do |t|
    t.integer  "followed_id"
    t.integer  "follower_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "follows", ["followed_id", "follower_id"], name: "index_follows_on_followed_id_and_follower_id", unique: true, using: :btree
  add_index "follows", ["follower_id"], name: "index_follows_on_followed_id", using: :btree

  create_table "forem_categories", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  add_index "forem_categories", ["slug"], name: "index_forem_categories_on_slug", unique: true, using: :btree

  create_table "forem_forums", force: true do |t|
    t.string  "name"
    t.text    "description"
    t.integer "category_id"
    t.integer "views_count", default: 0
    t.string  "slug"
    t.integer "sort_order"
  end

  add_index "forem_forums", ["slug"], name: "index_forem_forums_on_slug", unique: true, using: :btree

  create_table "forem_groups", force: true do |t|
    t.string "name"
  end

  add_index "forem_groups", ["name"], name: "index_forem_groups_on_name", using: :btree

  create_table "forem_memberships", force: true do |t|
    t.integer "group_id"
    t.integer "member_id"
  end

  add_index "forem_memberships", ["group_id"], name: "index_forem_memberships_on_group_id", using: :btree

  create_table "forem_moderator_groups", force: true do |t|
    t.integer "forum_id"
    t.integer "group_id"
  end

  add_index "forem_moderator_groups", ["forum_id"], name: "index_forem_moderator_groups_on_forum_id", using: :btree

  create_table "forem_posts", force: true do |t|
    t.integer  "topic_id"
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "reply_to_id"
    t.string   "state",          default: "approved"
    t.boolean  "notified",       default: false
    t.text     "formatted_html"
  end

  add_index "forem_posts", ["reply_to_id"], name: "index_forem_posts_on_reply_to_id", using: :btree
  add_index "forem_posts", ["state"], name: "index_forem_posts_on_state", using: :btree
  add_index "forem_posts", ["topic_id"], name: "index_forem_posts_on_topic_id", using: :btree
  add_index "forem_posts", ["user_id"], name: "index_forem_posts_on_user_id", using: :btree

  create_table "forem_subscriptions", force: true do |t|
    t.integer "subscriber_id"
    t.integer "topic_id"
  end

  create_table "forem_topics", force: true do |t|
    t.integer  "forum_id"
    t.integer  "user_id"
    t.string   "subject"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.boolean  "locked",       default: false,      null: false
    t.boolean  "pinned",       default: false
    t.boolean  "hidden",       default: false
    t.datetime "last_post_at"
    t.string   "state",        default: "approved"
    t.integer  "views_count",  default: 0
    t.string   "slug"
  end

  add_index "forem_topics", ["forum_id"], name: "index_forem_topics_on_forum_id", using: :btree
  add_index "forem_topics", ["slug"], name: "index_forem_topics_on_slug", unique: true, using: :btree
  add_index "forem_topics", ["state"], name: "index_forem_topics_on_state", using: :btree
  add_index "forem_topics", ["user_id"], name: "index_forem_topics_on_user_id", using: :btree

  create_table "forem_views", force: true do |t|
    t.integer  "user_id"
    t.integer  "viewable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "count",             default: 0
    t.string   "viewable_type"
    t.datetime "current_viewed_at"
    t.datetime "past_viewed_at"
  end

  add_index "forem_views", ["updated_at"], name: "index_forem_views_on_updated_at", using: :btree
  add_index "forem_views", ["user_id"], name: "index_forem_views_on_user_id", using: :btree
  add_index "forem_views", ["viewable_id"], name: "index_forem_views_on_topic_id", using: :btree

  create_table "franchises", force: true do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "english_title"
    t.string   "romaji_title"
  end

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", unique: true, using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "gallery_images", force: true do |t|
    t.integer  "anime_id"
    t.text     "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "gallery_images", ["anime_id"], name: "index_gallery_images_on_anime_id", using: :btree

  create_table "genres", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
  end

  create_table "genres_manga", id: false, force: true do |t|
    t.integer "manga_id", null: false
    t.integer "genre_id", null: false
  end

  add_index "genres_manga", ["genre_id"], name: "index_genres_manga_on_genre_id", using: :btree
  add_index "genres_manga", ["manga_id"], name: "index_genres_manga_on_manga_id", using: :btree

  create_table "images", force: true do |t|
    t.string   "image"
    t.integer  "imageable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "imageable_type"
  end

  add_index "images", ["imageable_id"], name: "index_images_on_imageable_id", using: :btree

  create_table "manga", force: true do |t|
    t.string   "romaji_title"
    t.string   "slug"
    t.string   "english_title"
    t.text     "synopsis",                  default: "",      null: false
    t.string   "poster_image_file_name"
    t.string   "poster_image_content_type"
    t.integer  "poster_image_file_size"
    t.datetime "poster_image_updated_at"
    t.string   "cover_image_file_name"
    t.string   "cover_image_content_type"
    t.integer  "cover_image_file_size"
    t.datetime "cover_image_updated_at"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "serialization"
    t.integer  "mal_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "status"
    t.integer  "cover_image_top_offset",    default: 0
    t.integer  "volume_count"
    t.integer  "chapter_count"
    t.string   "manga_type",                default: "Manga"
  end

  create_table "manga_library_entries", force: true do |t|
    t.integer  "user_id",                                               null: false
    t.integer  "manga_id",                                              null: false
    t.string   "status",                                                null: false
    t.boolean  "private",                               default: false, null: false
    t.integer  "chapters_read",                         default: 0,     null: false
    t.integer  "volumes_read",                          default: 0,     null: false
    t.integer  "reread_count",                          default: 0,     null: false
    t.boolean  "rereading",                             default: false, null: false
    t.datetime "last_read"
    t.decimal  "rating",        precision: 2, scale: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "notes"
    t.boolean  "imported",                              default: false, null: false
  end

  add_index "manga_library_entries", ["manga_id"], name: "index_manga_library_entries_on_manga_id", using: :btree
  add_index "manga_library_entries", ["user_id"], name: "index_manga_library_entries_on_user_id", using: :btree

  create_table "not_interesteds", force: true do |t|
    t.integer  "user_id"
    t.integer  "media_id"
    t.string   "media_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "not_interesteds", ["user_id"], name: "index_not_interesteds_on_user_id", using: :btree

  create_table "notifications", force: true do |t|
    t.integer  "user_id"
    t.integer  "source_id"
    t.string   "source_type"
    t.hstore   "data"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "notification_type"
    t.boolean  "seen",              default: false
  end

  add_index "notifications", ["source_id"], name: "index_notifications_on_source_id", using: :btree
  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id", using: :btree

  create_table "people", force: true do |t|
    t.string   "name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "mal_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "people", ["mal_id"], name: "index_people_on_mal_id", unique: true, using: :btree
  add_index "people", ["mal_id"], name: "person_mal_id", unique: true, using: :btree

  create_table "producers", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotes", force: true do |t|
    t.integer  "anime_id"
    t.text     "content"
    t.string   "character_name"
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "positive_votes", default: 0, null: false
  end

  create_table "rails_admin_histories", force: true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month"
    t.integer  "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recommendation_groups", force: true do |t|
    t.string   "name"
    t.string   "website"
    t.integer  "source_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
    t.text     "description"
  end

  add_index "recommendation_groups", ["source_id"], name: "index_recommendation_groups_on_source_id", using: :btree

  create_table "recommendations", force: true do |t|
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "recommendation_group_id"
  end

  add_index "recommendations", ["recommendation_group_id"], name: "index_recommendations_on_recommendation_group_id", using: :btree
  add_index "recommendations", ["restaurant_id"], name: "index_recommendations_on_restaurant_id", using: :btree

  create_table "restaurants", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "recommendations_count", default: 0
    t.string   "website"
    t.integer  "sources_list",          default: [], array: true
    t.string   "categories_list",       default: [], array: true
  end

  create_table "reviews", force: true do |t|
    t.integer  "user_id"
    t.integer  "anime_id"
    t.text     "content"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "rating"
    t.string   "source"
    t.integer  "rating_story"
    t.integer  "rating_animation"
    t.integer  "rating_sound"
    t.integer  "rating_character"
    t.integer  "rating_enjoyment"
    t.string   "summary"
    t.float    "wilson_score",     default: 0.0
    t.integer  "positive_votes",   default: 0
    t.integer  "total_votes",      default: 0
  end

  create_table "sources", force: true do |t|
    t.string   "name"
    t.string   "category"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  create_table "stories", force: true do |t|
    t.integer  "user_id"
    t.hstore   "data"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "story_type"
    t.integer  "target_id"
    t.string   "target_type"
    t.integer  "watchlist_id"
    t.boolean  "adult",        default: false
  end

  add_index "stories", ["user_id"], name: "index_stories_on_user_id", using: :btree

  create_table "substories", force: true do |t|
    t.integer  "user_id"
    t.string   "substory_type"
    t.integer  "story_id"
    t.integer  "target_id"
    t.string   "target_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.hstore   "data"
  end

  add_index "substories", ["story_id"], name: "index_substories_on_story_id", using: :btree
  add_index "substories", ["target_id"], name: "index_substories_on_target_id", using: :btree
  add_index "substories", ["user_id"], name: "index_substories_on_user_id", using: :btree

  create_table "user_preferences", force: true do |t|
    t.integer  "user_id"
    t.integer  "no_show_sources",     default: [], array: true
    t.integer  "no_show_restaurants", default: [], array: true
    t.integer  "tried_restaurants",   default: [], array: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_preferences", ["user_id"], name: "index_user_preferences_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: true do |t|
    t.integer  "target_id",                  null: false
    t.string   "target_type",                null: false
    t.integer  "user_id",                    null: false
    t.boolean  "positive",    default: true, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "votes", ["target_id", "target_type", "user_id"], name: "index_votes_on_target_id_and_target_type_and_user_id", unique: true, using: :btree
  add_index "votes", ["user_id", "target_type"], name: "index_votes_on_user_id_and_target_type", using: :btree

  create_table "watchlists", force: true do |t|
    t.integer  "user_id"
    t.integer  "anime_id"
    t.string   "status"
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.integer  "episodes_watched",                         default: 0,     null: false
    t.decimal  "rating",           precision: 2, scale: 1
    t.datetime "last_watched"
    t.boolean  "imported"
    t.boolean  "private",                                  default: false
    t.text     "notes"
    t.integer  "rewatch_count",                            default: 0,     null: false
    t.boolean  "rewatching",                               default: false, null: false
  end

  add_index "watchlists", ["user_id", "anime_id"], name: "index_watchlists_on_user_id_and_anime_id", unique: true, using: :btree
  add_index "watchlists", ["user_id", "status"], name: "index_watchlists_on_user_id_and_status", using: :btree
  add_index "watchlists", ["user_id"], name: "index_watchlists_on_user_id", using: :btree

end
