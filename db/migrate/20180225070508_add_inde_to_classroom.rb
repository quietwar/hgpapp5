class AddIndeToClassroom < ActiveRecord::Migration[5.1]
  def change
        add_index "classrooms", ["cohort_id"], name: "index_classrooms_on_cohort_id", using: :btree
  end
end
 
