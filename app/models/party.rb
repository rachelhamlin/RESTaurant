class Party < ActiveRecord::Base
  belongs_to :employee
  has_many :items
end
