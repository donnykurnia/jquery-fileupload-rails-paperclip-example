class Prompt < ActiveRecord::Base
  # associations
  has_many :uploads

  # scope
  default_scope order('created_at asc')

end
