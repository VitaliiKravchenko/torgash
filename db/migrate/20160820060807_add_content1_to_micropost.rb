class AddContent1ToMicropost < ActiveRecord::Migration
  def change
    add_column :microposts, :content1, :string
  end
end
