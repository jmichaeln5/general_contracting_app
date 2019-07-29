class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.text :description
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
