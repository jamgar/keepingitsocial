class Element < ApplicationRecord
  belongs_to :page

  def by_position
    order(position: :asc)
  end
end
