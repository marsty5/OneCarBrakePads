class OrderPart < ActiveRecord::Base
  belongs_to :part_type
  belongs_to :order
end
