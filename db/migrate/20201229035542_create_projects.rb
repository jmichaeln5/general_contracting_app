class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :projectable_type
      t.integer :projectable_id
      t.integer :user_id
      t.string :title
      t.string :category
      t.text :description
      t.datetime :start_date
      t.datetime :estimated_end_date
      t.datetime :end_date
      t.float :estimated_cost
      t.float :cost
      t.string :status
      t.string :check_in
      t.string :payment_method
      t.float :latitude
      t.float :longitude
      t.string :address
      t.string :link
      t.string :city
      t.string :state
      t.integer :zip
      t.timestamps
    end
  end
end
