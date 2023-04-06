Redmine::Plugin.register :redmine_control_point do
  name 'Redmine Control Point plugin'
  author 'Pavel Androsovich'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url ''
  author_url ''

  project_module :points do
    permission :permission_view_paints, { points: [:index, :show], points_layout: [:view_all_points], read: true }
    permission :permission_new_paints, points: [:new, :create, :destroy]
  end

  menu :project_menu, :points, { controller: :points, action: :index }, caption: "Контрольная точка", param: :project_id
  menu :application_menu, 
  :points, { controller: :points_layout, action: :view_all_points }, :caption => "Контрольная точка",
  :if =>
  Proc.new {
    User.current.allowed_to?(:permission_view_paints, nil, :global => true)
  }
  
  
  

end
