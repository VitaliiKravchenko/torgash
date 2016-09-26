class AddLowerIndexesToProducts < ActiveRecord::Migration
  def up
    execute %{
      CREATE INDEX
        products_lower_title
      ON
        products (lower(title) varchar_pattern_ops)
      }
    execute %{
      CREATE INDEX
        products_lower_description
      ON
        products (lower(description) varchar_pattern_ops)
      }
    execute %{
      CREATE INDEX
        users_lower_name
      ON
        users (lower(name) varchar_pattern_ops)
      }
  end

  def down
    remove_index :products, name: 'products_lower_title'
    remove_index :products, name: 'products_lower_description'
    remove_index :users, name: 'users_lower_name'
  end
end
