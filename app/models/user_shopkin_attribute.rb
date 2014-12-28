class UserShopkinAttribute < ActiveRecord::Base
  belongs_to :user
  belongs_to :shopkin
end
