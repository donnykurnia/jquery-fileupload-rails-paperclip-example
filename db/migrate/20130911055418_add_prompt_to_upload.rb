class AddPromptToUpload < ActiveRecord::Migration
  def change
    add_reference :uploads, :prompt, index: true
  end
end
