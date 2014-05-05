class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|

    	t.string :title
    	t.string :task_type
    	t.text :description
    	t.string :address
    	t.float :latitude
    	t.float :longitude
    	t.date :start_date
    	t.decimal :budget

      t.timestamps
    end
  end
end
