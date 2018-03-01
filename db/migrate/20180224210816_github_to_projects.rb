class GithubToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :github, :string
  end
end
