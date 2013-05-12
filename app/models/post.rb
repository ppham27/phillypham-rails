class Post < ActiveRecord::Base  
  attr_accessible :content, :subtitle, :title

  belongs_to :user
end
