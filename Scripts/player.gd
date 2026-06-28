#this is partly hackclub's code
extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

const PIVOT_X = -13.0

func _process(delta):	
	if Input.is_action_pressed("ui_right"):
		animated_sprite.play("run")
	elif Input.is_action_pressed("ui_left"):
		animated_sprite.play("run")
	else:
		animated_sprite.play("idle")
	
	position += velocity * delta
	
	# Determine which side of pivot the character is on
	if position.x < PIVOT_X:
		# Left side: flip and mirror position
		animated_sprite.flip_h = true
		position.x = 2 * PIVOT_X - position.x
	else:
		# Right side: normal
		animated_sprite.flip_h = false
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_just_pressed("ui_accept"):
		animated_sprite.play("jump")
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
