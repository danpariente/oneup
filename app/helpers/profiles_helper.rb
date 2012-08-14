module ProfilesHelper
  def display_resume(subject, profile)
    if true       
      #resume_box  
      content_tag :div, id: 'resume_box' do
        render "#{subject}", profile: profile                          
        link_to "+ add ", "/user/#{@user.username}/profile/#{subject}/new"#new_user_profile_education_path(@user.username)
      end
    else 
      render subject, profile: profile    
    end  
  end  
end
