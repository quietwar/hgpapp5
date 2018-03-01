class AddClassroomsTables < ActiveRecord::Migration[5.1]
  def change
          add_column :classrooms, :meeting,   :datetime,   null: false
          add_column :classrooms, :end_time,  :datetime,   null: false
          add_column :classrooms, :subject,   :string,  limit: 40, null: false
          add_column :classrooms, :cohort_id, :integer
  end
end
