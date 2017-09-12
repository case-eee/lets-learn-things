class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
    	t.string :name
    	t.references :company
    	t.boolean :active

    	t.timestamps
    end
  end
end
