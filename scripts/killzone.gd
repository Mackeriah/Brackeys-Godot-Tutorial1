extends Area2D

@onready var timer = $Timer
@onready var game_manager = %GameManager
@onready var animation_player = $AnimationPlayer

func _on_body_entered(_body):		
	animation_player.play("PlayerDeathSound")
	Engine.time_scale = 0.5	
	_body.get_node("CollisionShape2D").queue_free()	
	timer.start()

func _on_timer_timeout():
	# when timer ends reload scene
	get_tree().reload_current_scene()
	Engine.time_scale = 1.0
