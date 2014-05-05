class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

    	t.string :firstname
    	t.string :surname
    	t.string :username
    	t.string :password_digest
    	t.string :address
    	t.float :latitude
    	t.float :longitude
    	t.string :user_type
    	t.string :email

      t.timestamps
    end
  end
end
