class DetailClass < ActiveRecord::Base
  has_many :detail_types
  validates :name, presence: true,
            length: { maximum: 100 }
end
