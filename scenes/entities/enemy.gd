extends CharacterBody2D

signal ai_movement

@export var height: float = 120.0
var speed = 250

func _ready() -> void:
	position.y = get_window().size.y / 2.0 + Globals.scorebar_height
	Globals.connect("scored", Callable(self, "reset_pos"))
	
func _physics_process(_delta: float) -> void:
	handleMovement()
	move_and_slide()
	
func reset_pos() -> void:
	position.y = get_window().size.y / 2.0 + Globals.scorebar_height
	
func handleMovement():
	var moveDirection = Input.get_vector("ui_left", "ui_right", "up2", "down2")
	velocity.y = moveDirection.y * speed
	
	if Globals.pause and !Globals.ai_mode:
		if velocity.y != 0:
			if (Globals.pause_steps < 10):
				Globals.pause_steps += 1
			else:
				Globals.pause = false
	elif Globals.ai_mode and !Globals.pause:
		handle_ai_movement()
		

func handle_ai_movement():
	var ball_position = get_node("/Entities/Ball").position
	if Globals.difficulty == 0:
		ai_easy_movement(ball_position)
	elif Globals.difficulty == 1:
		ai_medium_movement(ball_position)
	else:
		ai_hard_movement(ball_position)
		
func ai_easy_movement(ball_position: Vector2):
	pass
	
func ai_medium_movement(ball_position: Vector2):
	pass
	
func ai_hard_movement(ball_position: Vector2):
	pass
