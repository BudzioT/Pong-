extends CharacterBody2D

@export var height: float = 120.0
var speed: int = 250
var stop_step: int = 0

func _ready() -> void:
	if get_window():
		position.y = get_window().size.y / 2.0 + Globals.scorebar_height
	Globals.connect("scored", Callable(self, "reset_pos"))
	speed = 250
	
func _physics_process(_delta: float) -> void:
	handleMovement()
	move_and_slide()
	
func reset_pos() -> void:
	if (get_window()):
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
	if Globals.difficulty == 0:
		ai_easy_movement(Globals.ball_position)
	elif Globals.difficulty == 1:
		ai_medium_movement(Globals.ball_position)
	else:
		ai_hard_movement(Globals.ball_position)
		
func ai_easy_movement(ball_position: Vector2):
	if position.y != ball_position.y && stop_step % 2:
		velocity.y += speed * sign(ball_position.y - position.y)
	stop_step += 1
	
func ai_medium_movement(ball_position: Vector2):
	speed = 150
	if position.y != ball_position.y:
		velocity.y += speed * sign(ball_position.y - position.y)
	
func ai_hard_movement(ball_position: Vector2):
	if position.y != ball_position.y:
		velocity.y += speed * sign(ball_position.y - position.y)
