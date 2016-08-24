class AddDescription1ToProduct < ActiveRecord::Migration
  def change
    add_column :products, :description1, :string
  end
end
