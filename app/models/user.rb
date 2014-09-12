class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable,
  # :lockable, :timeoutable and :omniauthable
  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  validates_presence_of :name

  has_many :offers, dependent: :destroy
  has_many :requests, dependent: :destroy

  scope :admin, -> { where admin: true }

  def unlock!
    self.unlocked = true
    self.save!
  end

  def lock!
    self.unlocked = false
    self.save!
  end

end
