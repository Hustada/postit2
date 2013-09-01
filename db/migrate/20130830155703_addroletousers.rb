class Addroletousers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string
  end
end
