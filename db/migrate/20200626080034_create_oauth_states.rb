class CreateOauthStates < ActiveRecord::Migration[6.0]
  create_table "oauth_states", force: :cascade do |t|
    t.string   "state"
    t.text     "payload"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state"], name: "index_oauth_states_on_state", using: :btree
  end
end
