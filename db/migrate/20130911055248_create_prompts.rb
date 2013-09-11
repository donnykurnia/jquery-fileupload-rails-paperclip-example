class CreatePrompts < ActiveRecord::Migration
  def change
    create_table :prompts do |t|
      t.string :uuid, unique: true

      t.timestamps
    end
  end
end
