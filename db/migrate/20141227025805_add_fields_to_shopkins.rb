class AddFieldsToShopkins < ActiveRecord::Migration
  def change
    add_column :shopkins, :rarity, :string
    add_column :shopkins, :series, :string
    add_column :shopkins, :team, :string
    add_column :shopkins, :image, :string
    add_column :shopkins, :finish, :string
    add_column :shopkins, :number, :string
  end
end
