class Shopkin < ActiveRecord::Base
  has_many :users, through: :shopkins_users
end
