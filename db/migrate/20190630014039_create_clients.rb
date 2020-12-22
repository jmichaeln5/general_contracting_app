class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|

      t.string :name
      t.string :phone_number
      t.string :email
      t.string :type_of_project
      t.datetime :check_in
      t.string :payment_method
      t.text :description
      t.float :latitude
      t.float :longitude
      t.string :address
      t.string :link
      t.string :city
      t.string :state
      t.integer :zip
      t.string :lead_status
      t.string :lead_source

      t.timestamps
    end
  end
end
