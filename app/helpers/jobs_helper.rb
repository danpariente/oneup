module JobsHelper
  
  def apply_job(job)    
    if current_user.applications.map(&:job_id).include? job.id      
      link_to "(UnApply)", job_application_path(job.id), method: :delete
    else  
      link_to "(Apply)", new_job_application_path(job.id)      
    end  
  end

  def block_job(job)
    if current_user.blocks.map(&:job_id).include? job.id
      link_to " UnBlock", Block.find_by_job_id_and_user_id(job.id,current_user.id), method: :delete
    elsif !current_user.blocks.map(&:job_id).include? job.id           
      link_to " Block", blocks_path(job_id: job.id), method: :post         
    end    
  end

  def watch_job(job)
    if current_user.watches.map(&:job_id).include? job.id
      link_to " UnWatch", Watch.find_by_job_id_and_user_id(job.id,current_user.id), method:  :delete
    else
      unless current_user.applications.map(&:job_id).include? job.id   
        link_to " Watch", watches_path(job_id: job.id), method: :post   
      end
    end    
  end

end
