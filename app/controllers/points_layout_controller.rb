class PointsLayoutController < ApplicationController

  #default_search_scope :points
  #model_object Point
 
  menu_item :points

  before_action :project_list_user, only: [:view_all_points]
  before_action :find_optional_project, only: [:view_all_points]
  

  def view_all_points
    @points_list=Point.all
    @points_projects_ids=@points_list.select(:project_id).distinct
    @issues_list=Issue.select(:id, :subject, :due_date, :status_id)
  end

  private 

    def project_list_user
      @projects_list=[]
      user=User.current

      if user.admin?
        ems=EnabledModule.select(:project_id).where(name: "points")
        
        ems.each do |em|
          @projects_list << Project.find(em.project_id)
        end
      else
        projects=user.projects

        projects.each do |project|
        
          if user.allowed_to?( :permission_view_paints, project )
            @projects_list << project
          end
        end
      end
    end
end
