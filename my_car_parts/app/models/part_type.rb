class PartType < ActiveRecord::Base
  has_many :order_parts
end
