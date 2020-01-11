extends Area2D

func _process(delta):
	if Input.is_action_just_pressed("hit"):
		for body in get_overlapping_bodies():
			body.apply_central_impulse(Vector2(100, 0))