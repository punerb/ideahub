module IdeasHelper

  def source_url(url)
    url =~ /^http/ ? url : "http://github.com/" 
  end

  def display_categories(idea)
    idea.categories.collect(&:name).join(', ').html_safe
  end

  def participate_button(idea)
    participant =  idea.users.include?(current_user) ? 'Not Anymore' : 'Participate'
    link_to participant, participate_idea_path(idea), :class => 'participate btn btn-info', :remote => true
  end

  def display_participants(idea)
    idea.users.collect{ |u|
      img_tag = image_tag("https://api.twitter.com/1/users/profile_image?screen_name=#{u.screen_name}&size=mini")
      link_to(img_tag, "http://twitter.com/#{u.screen_name}", :target => :_blank)
    }.join.html_safe
  end
end
