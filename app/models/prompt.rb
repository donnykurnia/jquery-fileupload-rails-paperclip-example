class Prompt < ActiveRecord::Base
  # associations
  has_many :uploads
end
