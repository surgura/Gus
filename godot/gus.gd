extends RigidBody2D

const move_force = 5000

var move_up = false
var move_down = false
var move_left = false
var move_right = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func input():
	if Input.is_action_pressed("up"):
		move_up = true
	else:
		move_up = false

	if Input.is_action_pressed("down"):
		move_down = true
	else:
		move_down = false
		
	if Input.is_action_pressed("left"):
		move_left = true
	else:
		move_left = false
		
	if Input.is_action_pressed("right"):
		move_right = true
	else:
		move_right = false

func _process(delta):
	input()

func _physics_process(delta):
	var do_move = false
	var move_direction = Vector2()
	if move_up:
		do_move = true
		move_direction += Vector2(0, -1)
	if move_down:
		do_move = true
		move_direction += Vector2(0, 1)
	if move_left:
		do_move = true
		move_direction += Vector2(-1, 0)
	if move_right:
		do_move = true
		move_direction += Vector2(1, 0)
	
	if do_move:
		set_applied_force(move_force * move_direction.normalized())
	else:
		set_applied_force(Vector2())
		
		
		
		
		
		