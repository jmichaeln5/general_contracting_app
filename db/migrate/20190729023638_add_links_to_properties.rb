class AddLinksToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :link, :string
  end
end
