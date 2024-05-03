extends Area2D




func _on_body_entered(body):
	print("You got one coin!")
	
	# remove coin
	queue_free()
