class Defect < ActiveRecord::Base
  belongs_to :detail
  belongs_to :wagon
end
