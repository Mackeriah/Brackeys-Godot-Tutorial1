extends Area2D

# create a variable and reference it to the timer node ($ is the path)
@onready var timer = $Timer

func _on_body_entered(_body):
	print("player died!")
	Engine.time_scale = 0.5
	_body.get_node("CollisionShape2D").queue_free()
	timer.start()

func _on_timer_timeout():
	# when timer ends reload scene
	get_tree().reload_current_scene()
	Engine.time_scale = 1.0
