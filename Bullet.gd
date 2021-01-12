extends KinematicBody2D

var speed : int = 300
var velocity : Vector2 = Vector2.ZERO

func _start(_direction):
	var player_position = get_tree().get_root().get_node("MainScene/Player").get_position();
	
	if _direction == Vector2.DOWN:
		position += player_position + Vector2(0, 40)
	elif _direction == Vector2.UP:
		position += player_position + Vector2(0, -40)
	elif _direction == Vector2.LEFT:
		position += player_position + Vector2(-40, 0)
	else:
		position += player_position + Vector2(40, 0)
	rotation = _direction.angle()
	velocity = _direction * speed

func _physics_process(delta):
	position += velocity * delta
