extends Node

signal p1_win
signal p2_win
signal scored
signal update_scores

var pause: int = true
var pause_steps: int = 0
var ai_mode: int = false
var scorebar_height: int = 47
var difficulty: int = 0
var globals_winner: int = 0

var ball_position: Vector2 = Vector2(0, 0)

var p1_score: int = 0:
	get:
		return p1_score
	set(value):
		if value < 5:
			p1_score = value
		else:
			p1_win.emit()
		
var p2_score: int = 0:
	get:
		return p2_score
	set(value):
		if value < 5:
			p2_score = value
		else:
			p2_win.emit()
			
func _ready() -> void:
	connect("scored", _on_scored)
	
func _on_scored():
	pause = true
	pause_steps = 0
	update_scores.emit()
	
