class Post < ActiveRecord::Base  
  attr_accessible :content, :subtitle, :title

  before_save :create_slug
  
  belongs_to :user

  validates_presence_of :content, :subtitle, :title
  validates_uniqueness_of :title

  def to_param
    self.slug
  end

  include ActionView::Helpers::SanitizeHelper
  def summarize(n = 300)    
    self.subtitle + '...' + strip_tags(self.content)[0..n-1]
  end
  
  private

  def create_slug
    self.slug = CGI::escape self.title.gsub /[^A-Za-z\s]/, ''
  end
end
