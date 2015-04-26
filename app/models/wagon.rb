class Wagon < ActiveRecord::Base
  acts_as_paranoid
  
  has_many :comments, dependent: :destroy
  validates :label, presence: true,
            uniqueness: { case_sensitive: false},
            length: { maximum: 20 }
end
