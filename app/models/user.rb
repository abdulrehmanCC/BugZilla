class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: {developer: 0, manager: 1, qa:2}
  # belongs_to :created_bugs, class_name: "Bug", optional: true
  # belongs_to :created_bugs, class_name: "Bug", optional: true
  
  validates :name, presence: true
  has_many :bugs, dependent: :destroy
  has_many :created_bugs, foreign_key: :user_id, class_name: "Bug"
  has_many :assigned_bugs, foreign_key: :developer_id, class_name: "Bug"
  has_many :project_users, dependent: :destroy
  has_many :projects, through: :project_users
end
