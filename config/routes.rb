# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

get "points", to: "points_layout#view_all_points"

resources :projects do
  resources :points
end






