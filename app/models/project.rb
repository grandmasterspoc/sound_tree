class Project < ApplicationRecord
  belongs_to :user
  after_create :create_project_repo

  def create_project_repo
    self.update(repo_path: "#{user.username}/#{title}")
    Dir.mkdir self.repo_path
  end
end
