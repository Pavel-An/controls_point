class Point < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  #validates :project_id, presence: true, numericality: { only_intenger: true}
  #validates :description, presence: true, length: { minimum: 5, maximum: 65 }
end
