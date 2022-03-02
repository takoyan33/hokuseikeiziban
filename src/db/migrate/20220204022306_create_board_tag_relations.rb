class CreateBoardTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :board_tag_relations do |t|
      t.references :board, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
