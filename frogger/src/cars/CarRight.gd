extends Area2D

func _ready():
	pass

func _process(_delta):
	position.x += 4
	if (position.x > 1100):
		position.x = -30
