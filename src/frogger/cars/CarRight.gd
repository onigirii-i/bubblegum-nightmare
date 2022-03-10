extends Area2D

func _ready():
	pass

func _process(_delta):
	position.x += 5
	if (position.x > 1150):
		position.x = -50
