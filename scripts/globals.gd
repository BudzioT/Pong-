extends Node

signal scored
signal update_scores

const scorebar_height: int = 47

var pause: int = true
var pause_steps: int = 0
var ai_mode: int = false
var difficulty: int = 0
var winner: int = 0

var ball_position: Vector2 = Vector2(0, 0)

var p1_score: int = 0:
	get:
		return p1_score
	set(value):
		if value < 5:
			p1_score = value
		else:
			winner = 1
			get_tree().call_deferred("change_scene_to_file", "res://scenes/end_menu.tscn")
		
var p2_score: int = 0:
	get:
		return p2_score
	set(value):
		if value < 5:
			p2_score = value
		else:
			winner = 2
			get_tree().call_deferred("change_scene_to_file", "res://scenes/end_menu.tscn")
			
func _ready() -> void:
	connect("scored", _on_scored)
	
func _on_scored():
	pause = true
	pause_steps = 0
	update_scores.emit()
	
func reset_stats():
	pause = true
	pause_steps = 0
	p1_score = 0
	p2_score = 0
	
