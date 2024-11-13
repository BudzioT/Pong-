extends TextureRect


func _ready() -> void:
	get_node("MarginContainer/VBoxContainer/GameOverLabel").text = \
		"Game over!\nPlayer " + str(Globals.winner) + " wins!"
	Globals.reset_stats()

func _on_rematch_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/map.tscn")

func _on_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
