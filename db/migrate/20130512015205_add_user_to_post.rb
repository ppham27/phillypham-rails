class AddUserToPost < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.belongs_to :user
      t.index :user_id
    end
  end
end
