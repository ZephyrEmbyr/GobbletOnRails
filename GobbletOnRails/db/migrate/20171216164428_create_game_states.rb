class CreateGameStates < ActiveRecord::Migration[5.1]
  def change
    create_table :game_states do |t|
      t.array :whitePieces
      t.array :blackPieces
      t.array :board
      t.string :turn

      t.timestamps
    end
  end
end
