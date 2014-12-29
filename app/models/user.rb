class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :shopkins, through: :shopkins_users

  def num_owned(shopkin)
    self.shopkins_users.owned(shopkin.id)
  end
end
