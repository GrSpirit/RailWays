class Wagon < ActiveRecord::Base
  validates :label, presence: true,
            length: { minimum: 1, maximum: 20}
end
