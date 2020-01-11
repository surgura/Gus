extends Area2D

func _process(delta):
	if Input.is_action_just_pressed("hit"):
		for body in get_overlapping_bodies():
			var vel = body.get_linear_velocity()
			if vel.y <= 0:
				body.set_linear_velocity(Vector2(-vel.x, vel.y))
				body.apply_central_impulse(Vector2(100, 0))