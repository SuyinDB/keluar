class CreatePitches < ActiveRecord::Migration
  def change
    create_table :pitches do |t|

    	t.integer :user_id
    	t.integer :task_id
    	t.decimal :price
    	t.text :body
    	t.date :start_date

      t.timestamps
    end
  end
end
