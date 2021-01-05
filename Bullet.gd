extends KinematicBody2D

var speed : int = 200
var velocity : Vector2 = Vector2.ZERO

func _set_movement(velocity_m : Vector2):
	velocity = velocity_m

func _movement():
	velocity = Vector2.ZERO
	velocity.y += 1
	velocity = velocity.normalized() * speed
	velocity = move_and_slide(velocity, Vector2.UP)

func _physics_process(delta):
	_movement()
