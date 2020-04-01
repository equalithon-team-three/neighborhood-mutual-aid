class Assignment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :status, class_name: "AssignmentStatus", foreign_key: "assignment_status_id"
end
