module ApplicationHelper
	
  def time_ago_in_words(timestamp)
    minutes = (((Time.now - timestamp).abs)/60).round
      return nil if minutes < 0
	  case minutes
	    when 0 then 'less than a minute ago'
	    when 0..4 then 'less than 5 minutes ago'
	    when 5..14 then 'less than 15 minutes ago'
	    when 15..29 then 'less than 30 minutes ago'
	    when 30..59 then 'more than 30 minutes ago'
	    when 60..119 then 'more than 1 hour ago'
	    when 120..239 then 'more than 2 hours ago'
	    when 240..479 then 'more than 4 hours ago'
	  else timestamp.strftime('%I:%M %p %d-%b-%Y')
	  end
  end
  
  def people_who_likes 
    self.likes.collect { |like| "<a href='/user/#{like.user.username}'>#{like.user.formatted_name}</a>" }	
  end
  
  def gravatar_for(user) 
  	"#{user.photo_url.nil? ? "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}" : user.photo_url }"
  end

  # Require jQuery from CDN if possible, falling back to vendored copy, and require
  # vendored jquery_ujs
  def jquery_include_tag
    buf = []
    if AppConfig[:jquery_cdn]
      version = Jquery::Rails::JQUERY_VERSION
      buf << [ javascript_include_tag("//ajax.googleapis.com/ajax/libs/jquery/#{version}/jquery.min.js") ]
      buf << [ javascript_tag("!window.jQuery && document.write(unescape('#{j javascript_include_tag("jquery")}'));") ]
    else
      buf << [ javascript_include_tag('jquery') ]
    end
    buf << [ javascript_include_tag('jquery_ujs') ]
    buf << [ javascript_tag("jQuery.ajaxSetup({'cache': false});") ]
    buf << [ javascript_tag("$.fx.off = true;") ] if Rails.env.test?
    buf.join("\n").html_safe
  end

  def can_apply?
    current_user.profile.present? &&
    (current_user.profile.educations.present?   ||
    current_user.profile.competencies.present?  ||
    current_user.profile.experiences.present?   ||
    current_user.profile.languages.present?     ||   
    current_user.profile.references.present?    ||
    current_user.profile.publications.present?)
  end
  
  def cant_apply?
    !can_apply?  
  end
  
  def score_color(scores, app, job)
    scores[app.user.username][job.job_title] > 1.5 ? "green" : 'gray'  
  end

  def score(scores, app, job)
    scores[app.user.username][job.job_title]    
  end  
end
