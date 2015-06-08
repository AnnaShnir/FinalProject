class CreateJoinTableUserParty < ActiveRecord::Migration
  def change
    create_join_table :users, :parties do |t|
      t.integer [:user_id, :party_id]
      t.integer [:party_id, :user_id]
    end
  end
end
