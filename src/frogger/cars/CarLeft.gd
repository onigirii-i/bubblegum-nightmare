extends Area2D

func _ready():
	pass

func _process(_delta):
	position.x -= 5
	if (position.x < -50):
		position.x = 2000
		

