extends TextureRect


func start_game(difficulty: int) -> void:
	Globals.difficulty = difficulty
	get_tree().change_scene_to_file("res://scenes/map.tscn")

func _on_easy_button_pressed() -> void:
	start_game(0)

func _on_medium_button_pressed() -> void:
	start_game(1)

func _on_hard_button_pressed() -> void:
	start_game(2)
	
