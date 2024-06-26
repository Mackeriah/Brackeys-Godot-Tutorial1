extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -300.0

@onready var animated_sprite = $AnimatedSprite2D
@onready var animation_player = $AnimationPlayer
@onready var game_manager = %GameManager

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	print(game_manager.quietPlease)
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
		# randomly play a jumping sound IF player hasn't turned off sounds
		if game_manager.quietPlease == false:
			if (randi() % 10) >= 6:	
				animation_player.play("playerJump")
			else:
				pass
		
	# Get the input direction 0, 1, -1
	var direction = Input.get_axis("move_left", "move_right")
	
	# direction 0 is not moving, 1 is right, -1 is left
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
	# Play animations
	if is_on_floor() == true:
		# if player not moving
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jumping")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	# allow player to turn off character talking
	if Input.is_action_just_pressed("no talking") and game_manager.quietPlease == false:
		game_manager.quietPlease = true		
	elif Input.is_action_just_pressed("no talking") and game_manager.quietPlease == true:
		game_manager.quietPlease = false		
