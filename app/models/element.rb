class Element < ApplicationRecord
  acts_as_list

  belongs_to :page
end
