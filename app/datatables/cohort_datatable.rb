class CohortsDatatable < ApplicationDatatable
  delegate :edit_cohorts_path, to: :@view

 private

 def data
   cohort.map do |cohort|
     [].tap do |column|
       column << cohort.cohort
       column << cohort.full_name
       column << cohort.benchmark
       column << cohort.stipend
       column << cohort.web_site
       column << cohort.final_project

       links = []
       links << link_to('Show', cohort)
       links << link_to('Edit', edit_cohorts_path(cohort))
       links << link_to('Destroy', user, method: :delete, data: { confirm: 'Are you sure?' })
       column << links.join(' | ')
     end
   end
 end

 def count
   Cohort.count
 end

 def total_entries
   #users.total_count
   # kaminari
   cohort.total_entries
 end

 def cohort
   @cohort ||= fetch_genius
 end

 def fetch_cohort
   search_string = []
   columns.each do |term|
     search_string << "#{term} like :search"
   end

   # kaminari
   cohorts = Cohort.page(page).per_page(per_page)
   cohorts = Cohort.order("#{sort_column} #{sort_direction}")
   #users = users.page(page).per(per_page)
   cohorts = cohorts.where(search_string.join(' or '), search: "%#{params[:search][:value]}%")
 end

 def columns
   %w(cohort genius benchmark stipend web_site final_project_)
 end

end
