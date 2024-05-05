extends Area2D

# create a variable and reference it to the timer node ($ is the path)
@onready var timer = $Timer
@onready var game_manager = %GameManager
@onready var animation_player = $AnimationPlayer

func _on_body_entered(_body):		
	Engine.time_scale = 0.5	
	_body.get_node("CollisionShape2D").queue_free()
	animation_player.play("PlayerDeathSound")
	timer.start()

func _on_timer_timeout():
	# when timer ends reload scene
	get_tree().reload_current_scene()
	Engine.time_scale = 1.0
