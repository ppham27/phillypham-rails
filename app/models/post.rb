class Post < ActiveRecord::Base  
  attr_accessible :content, :subtitle, :title

  before_create :create_slug
  
  belongs_to :user

  validates_presence_of :content, :subtitle, :title
  validates_uniqueness_of :title

  def to_param
    self.slug
  end
  
  private

  def create_slug
    self.slug = CGI::escape self.title
  end
end
