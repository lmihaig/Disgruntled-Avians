extends Node2D

enum GameState {
	Start,
	Playing,
	Win,
	Lose
}

var CurGameState = GameState.Start

# Called when the node enters the scene tree for the first time.
func _ready():
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match CurGameState:
		GameState.Start:
			pass
		GameState.Playing:
			pass
		GameState.Win:
			pass
		GameState.Lose:
			pass
	pass

