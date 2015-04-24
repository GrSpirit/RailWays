class Wagon < ActiveRecord::Base
  acts_as_paranoid
  
  has_many :comments, dependent: :destroy
  validates :label, presence: true,
            length: { maximum: 20 }
end
