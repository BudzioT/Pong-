extends Area2D

var motion: Vector2 = Vector2(-1, 0)
var movement
var speed = 300

func _physics_process(delta: float) -> void:
	if !Globals.pause:
		handleMovement(delta)
		#bounce()
	
func handleMovement(delta: float) -> void:
	movement = speed * motion.normalized() * delta
	position += movement

func _on_area_entered(area: Area2D) -> void:
	if area.name.contains("DeathZone"):
		if movement.x < 0:
			Globals.p1_score += 1
		else:
			Globals.p2_score += 1
		Globals.emit_signal("scored")
		speed = 300
		var size = get_window().size
		position = Vector2(size.x / 2, size.y / 2 + Globals.scorebar_height)


func _on_body_entered(body: Node2D) -> void:
	if body.name.contains("Wall"):
		motion.y = -motion.y
	else:
		motion.x = -motion.x
		
		var relative_y = position.y - body.position.y
		var hit_factor = relative_y / (body.height / 2)
		
		speed += 20
		
		motion.y = hit_factor * 0.8 + randf_range(-0.2, 0.2)
		motion = motion.normalized()
