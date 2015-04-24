class DetailType < ActiveRecord::Base
  has_many :detail_models, dependent: :destroy
  belongs_to :detail_class
  validates :name, presence: true,
            length: { maximum: 100 }
  validates :detail_class_id, presence: true
end
