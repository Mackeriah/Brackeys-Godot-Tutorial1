extends Area2D

# create a variable and reference it to the timer node ($ is the path)
@onready var timer = $Timer

func _on_body_entered(_body):
	print("player died MOFO!")
	timer.start()

func _on_timer_timeout():
	# when timer ends reload scene
	get_tree().reload_current_scene()
