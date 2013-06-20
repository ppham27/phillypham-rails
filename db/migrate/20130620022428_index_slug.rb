class IndexSlug < ActiveRecord::Migration
  def up
    change_table :posts do |t|
      t.index :slug, unique: true
    end
  end

  def down
    change_table :posts do |t|
      t.remove_index column: :slug
    end
  end
end
