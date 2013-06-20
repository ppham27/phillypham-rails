module ApplicationHelper
  def tweet_button(options = {})
    options[:url] = options[:url] || request.url
    options[:text] = options[:text] || "Check out"
    link_to "Tweet", 'https://twitter.com/share?' + options.to_query, class: 'twitter-share-button'
  end

  def facebook_button(options = {})
    options[:href] = options[:href] || request.url
    options[:layout] = options[:layout] || 'button_count'
    options[:width] = options[:width] || '200'
    options[:send] = options[:send] || 'true'
    content_tag 'div', "", class: 'fb-like', data: options
  end  
end
