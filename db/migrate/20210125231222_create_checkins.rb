class CreateCheckins < ActiveRecord::Migration[5.2]
  def change
    create_table :checkins do |t|
      t.string :checkinable_type
      t.integer :checkinable_id
      t.integer :user_id
      t.datetime :time_contacted
      # t.text :method_of_contact
      t.text :description

      t.timestamps
    end
  end
end
