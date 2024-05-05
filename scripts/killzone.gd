extends Area2D

@onready var timer = $Timer
@onready var animation_player = $AnimationPlayer
@onready var player = $"../Player"
@onready var game_manager = %GameManager

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	check_game_manager()

 # if player hasn't turnred off sounds
func check_game_manager():
	pass
	#if game_manager.score == 0:
		#print("hello world")

func _on_body_entered(_body):			
	animation_player.play("PlayerDeathSound")
	Engine.time_scale = 0.5	
	_body.get_node("CollisionShape2D").queue_free()	
	timer.start()

func _on_timer_timeout():
	# when timer ends reload scene
	get_tree().reload_current_scene()
	Engine.time_scale = 1.0
