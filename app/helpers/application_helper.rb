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
    options[:'show-faces'] = options[:'show-faces'] || 'false'
    content_tag 'div', "", class: 'fb-like', data: options
  end
  
  def image_url(source)
    URI.join(root_url, image_path(source)).to_s
  end

  def display_og_meta_tags(og = {})
    default_og = {image: image_url("profile.jpg"),
      site_name: 'PhillyPham.com',
      url: request.url,
      title: "PhillyPham",
      type: "article",
      description: "Philip Pham's blog"}
    og = default_og.merge og
    og[:description] = strip_tags(render(inline: og[:description]))
    display_meta_tags og: og
  end
end
