class Search < ActiveRecord::Base
  attr_accessible :category, :keywords, :level, :location, :max_sal, :min_sal, :job_type

  def jobs
    @jobs ||= find_jobs
  end

private

  def find_jobs
    jobs = Job.order(:job_title)    
    jobs = jobs.where("job_title like ?", "%#{keywords}%") if keywords.present?
    jobs = jobs.where("job_type like ?", "%#{job_type}%") if job_type.present?
    jobs = jobs.where("job_category like ?", "%#{category}%") if category.present?
    jobs = jobs.where("working_location like ?", "%#{location}%") if location.present?
    jobs = jobs.where("lowest_education_level like ?", "%#{level}%") if level.present?
    jobs = jobs.where("salary_min >= ?", min_sal) if min_sal.present?
    jobs = jobs.where("salary_max <= ?", max_sal) if max_sal.present?
    jobs
  end  
end
