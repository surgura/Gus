extends RigidBody2D

export (bool) var invert = false
const move_force = 10000

var move_up = false
var move_down = false

func do_invert():
	if invert:
		get_node("AnimatedSprite").flip_h = false
		var hitbox = get_node("HitArea/Shape")
		var trans = hitbox.get_transform()
		trans.origin = Vector2(-trans.get_origin().x, trans.get_origin().y)
		hitbox.set_transform(trans)
		get_node("HitArea").invert = true

func _ready():
	do_invert()

func input():
	if Input.is_action_pressed("up"):
		move_up = true
	else:
		move_up = false

	if Input.is_action_pressed("down"):
		move_down = true
	else:
		move_down = false

func _process(_delta):
	input()

func _physics_process(_delta):
	var do_move = false
	var move_direction = Vector2()
	if move_up:
		do_move = true
		move_direction += Vector2(0, -1)
	if move_down:
		do_move = true
		move_direction += Vector2(0, 1)
	
	if do_move:
		set_applied_force(move_force * move_direction.normalized())
	else:
		set_applied_force(Vector2())