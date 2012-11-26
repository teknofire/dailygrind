module ApplicationHelper
  def flash_messages
    output = ""
    flash.each do |type,msg|
      if msg.is_a? Array
        msg.each do |m|
          output << message(type, m)
        end
      else
        output << message(type, msg)
      end
    end
    output.html_safe
  end
  
  def message(type, text)
    content_tag(:div, class: "alert alert-#{type}") do
      "#{text} #{link_to 'x', '#', class: 'close', "data-dismiss" => "alert"}".html_safe
    end
  end
  
  def avatar_url(email, size=48)
    email = '' if email.nil?
    gravatar_id = Digest::MD5.hexdigest(email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end
end
