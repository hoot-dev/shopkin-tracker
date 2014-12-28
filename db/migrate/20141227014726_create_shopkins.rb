class CreateShopkins < ActiveRecord::Migration
  def change
    create_table :shopkins do |t|
      t.string :name

      t.timestamps
    end
  end
end
