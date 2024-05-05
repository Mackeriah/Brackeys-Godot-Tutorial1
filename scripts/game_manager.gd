extends Node

var score = 0
var quietPlease = false

@onready var score_label = $"../Player/ScoreLabel"
@onready var player = $"../Player"


func add_point():	
	score += 1	
	if score < 2:
		score_label.text = "You collected " + str(score) + " coin."
	else:
		score_label.text = "You collected " + str(score) + " coins."
		
