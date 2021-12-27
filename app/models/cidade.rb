class Cidade < ApplicationRecord
  belongs_to :estado
  has_many :people
end
