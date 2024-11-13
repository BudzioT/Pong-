extends CharacterBody2D

@export var height: float = 120.0
var speed = 250

func _ready() -> void:
	reset_pos()
	Globals.connect("scored", Callable(self, "reset_pos"))

func _physics_process(_delta: float) -> void:
	"""Handle player's changes"""
	handleInput()
	move_and_slide()
	
func reset_pos() -> void:
	if (get_window()):
		position.y = get_window().size.y / 2.0 + Globals.scorebar_height
	
func handleInput():
	var moveDirection = Input.get_vector("ui_left", "ui_right", "up1", "down1")
	velocity.y = moveDirection.y * speed
	if Globals.pause:
		if velocity.y != 0:
			if (Globals.pause_steps < 10):
				Globals.pause_steps += 1
			else:
				Globals.pause = false
	
