class CreateProblems < ActiveRecord::Migration[5.2]
  def change
    create_table :problems do |t|
      t.string :name
      t.string :content
      t.string :hint
      t.string :solution
      t.integer :rating
      t.string :answer
      t.string :category
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
