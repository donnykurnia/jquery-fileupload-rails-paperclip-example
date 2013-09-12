class Prompt < ActiveRecord::Base
  # associations
  has_many :uploads, dependent: :destroy

  # scope
  default_scope order('created_at asc')

end
