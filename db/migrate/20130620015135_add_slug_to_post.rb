class AddSlugToPost < ActiveRecord::Migration
  class Post < ActiveRecord::Base
  end
  
  def change
    change_table :posts do |t|
      t.string :slug      
    end
    Post.find_each do |post|
      post.slug = CGI::escape post.title
      post.save!
    end
    change_table :posts do |t|
      t.change :slug, :string, null: false
    end
  end
end
