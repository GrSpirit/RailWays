class Detail < ActiveRecord::Base
  belongs_to :detail_model
  validates :name, presence: true,
            length: { maximum: 255 }
  validates :detail_model_id, presence: true
end
