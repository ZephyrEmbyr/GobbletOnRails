json.extract! game_state, :id, :whitePieces, :blackPieces, :board, :turn, :created_at, :updated_at
json.url game_state_url(game_state, format: :json)
