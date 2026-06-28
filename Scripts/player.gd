#this is partly hackclub's code
extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

const SPEED = 400.0
const JUMP_VELOCITY = -525.0

func _process(delta):
	if Input.is_action_pressed("ui_right"):
		animated_sprite.play("run")
		animated_sprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		animated_sprite.play("run")
		animated_sprite.flip_h = true
	else:
		animated_sprite.play("idle")
	
	if not is_on_floor():
		velocity += get_gravity() * delta
		animated_sprite.play("jump")
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
