extends Area2D

func _ready():
	pass

func _process(_delta):
	position.x -= 4
	if (position.x < -20):
		position.x = 1150
		

