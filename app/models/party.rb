class Party < ActiveRecord::Base
  belongs_to :employee
  has_many :orders
  has_many :items, through: :orders
end
