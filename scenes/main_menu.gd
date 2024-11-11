extends TextureRect


func _on_multi_button_pressed() -> void:
	Globals.ai_mode = false
	get_tree().change_scene_to_file("res://scenes/map.tscn")


func _on_solo_button_pressed() -> void:
	Globals.ai_mode = true
	get_tree().change_scene_to_file("res://scenes/difficulty_menu.tscn")
