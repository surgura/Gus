extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var leftPoints = 0
var rightPoints = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("RightPlayerPoints").text = str(rightPoints)
	get_node("LeftPlayerPoints").text = str(leftPoints)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_LeftGoal_body_entered(body):
	rightPoints += 1
	get_node("RightPlayerPoints").text = str(rightPoints)
	print("Right player scores")


func _on_RightGoal_body_entered(body):
	leftPoints += 1
	get_node("LeftPlayerPoints").text = str(leftPoints)
	print("Left player scores")
