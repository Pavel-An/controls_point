class PointsController < ApplicationController
  

  default_search_scope :points
  model_object Point
  before_action :find_project_by_project_id, :only => [:index, :new, :create]
  before_action :find_model_object, :except => [:index, :new, :create]
  before_action :find_project_from_association, :except => [:index, :new, :create]
  before_action :authorize
  

  def index
    @points=Point.where("project_id=?", @project.id)
    @issues=Issue.where("project_id=?", @project.id)
  end

  #def show
   # @points=Point.find(params[:id])
  #end

  def new
    @point=Point.new()
    @points=Point.all
    @issues=Issue.where("project_id=?", @project.id)
  end

  def create
    unless point_issues_id[:issue_id].blank?
      point_issues_id[:issue_id].compact!
      point_issues_id[:issue_id].each do |id|
   
        @point=Point.create(issue_id: id, project_id: @project.id)
        #@point.save
      end
     redirect_to  project_points_path
    else
      redirect_to new_project_point_path
    end
  end

  def edit
    @point=Point.find(params[:id])
  end

  def update
    @point=Point.find(params[:id])

    if @point.update(point_params)
      redirect_to  project_points_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @point=Point.find(params[:id])
    @point.destroy

    redirect_to  project_points_path, status: :see_other
  end

  private

    def point_issues_id
      params.require(:point).permit(issue_id: [])
    end
end