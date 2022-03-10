extends Area2D

var score = 0

func _physics_process(delta):
	position.y += 5
	#$CanvasLayer/Label.text = "Lives Remaining: " + str(health)


func _on_shot_body_entered(body):
	if body.name == "shot":
		queue_free()

