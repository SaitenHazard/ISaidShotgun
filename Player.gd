extends KinematicBody2D

onready var sprite : Sprite = get_node("Sprite")

var tex_down = preload("res://Sprites/Player/down.png")
var tex_up = preload("res://Sprites/Player/up.png")
var tex_right = preload("res://Sprites/Player/right.png")

var speed : int = 200
var velocity : Vector2 = Vector2.ZERO
var direction : Vector2 = Vector2.DOWN

func _shoot():
	if Input.is_action_just_pressed("shoot"):
		var scene = load("res://Bullet.tscn")
		var bullet = scene.instance()
		add_child(bullet)
		bullet.set_as_toplevel(true)

func _movement():
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("right"):
		velocity = Vector2.RIGHT
	elif Input.is_action_pressed("left"):
		velocity = Vector2.LEFT
	elif Input.is_action_pressed("up"):
		velocity = Vector2.UP
	elif Input.is_action_pressed("down"):
		velocity = Vector2.DOWN
		
	if velocity != Vector2.ZERO:
		direction = velocity
		
	velocity = velocity.normalized() * speed
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
func _set_sprite():
	if direction == Vector2.DOWN:
		sprite.set_texture(tex_down)
	elif direction == Vector2.UP:
		sprite.set_texture(tex_up)
	elif direction == Vector2.LEFT:
		sprite.set_texture(tex_right)
		sprite.flip_h = true
	elif direction == Vector2.RIGHT:
		sprite.set_texture(tex_right) 
		sprite.flip_h = false
	
func _physics_process(delta):
	_movement()
	_set_sprite()
	_shoot()
