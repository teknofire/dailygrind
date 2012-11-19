module ApplicationHelper
  def flash_messages
    output = ""
    flash.each do |type,msg|
      output << content_tag(:div, class: "alert alert-#{type}") do
        "#{msg} #{link_to 'x', '#', class: 'close', "data-dismiss" => "alert"}".html_safe
      end
    end
    output.html_safe
  end
  
  def avatar_url(email, size=48)
    email = '' if email.nil?
    gravatar_id = Digest::MD5.hexdigest(email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end
end
