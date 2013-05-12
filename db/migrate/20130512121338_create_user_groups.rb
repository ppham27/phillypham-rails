class CreateUserGroups < ActiveRecord::Migration
  def change
    create_table :user_groups do |t|
      t.string :name
      t.boolean :can_create_post
      t.boolean :can_edit_post
      t.boolean :can_destroy_post

      t.timestamps
    end
  end
end
