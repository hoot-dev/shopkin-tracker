class CreateUserShopkinAttributes < ActiveRecord::Migration
  def change
    create_table :user_shopkin_attributes do |t|
      t.belongs_to :users, index: true
      t.belongs_to :shopkins, index: true
      t.string :rating
      t.integer :owned

      t.timestamps
    end
  end
end
