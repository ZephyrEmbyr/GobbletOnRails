class CreateGameStates < ActiveRecord::Migration[5.1]
  def change
    create_table :game_states do |t|
      t.string :whitePieces
      t.string :blackPieces
      t.string :board
      t.string :turn

      t.timestamps
    end
  end
end
