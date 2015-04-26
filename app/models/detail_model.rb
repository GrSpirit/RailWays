class DetailModel < ActiveRecord::Base
  has_many :details
  belongs_to :detail_type
  validates :name, presence: true,
            length: { maximum: 255 }
  validates :detail_type, presence: true
end
