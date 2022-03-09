extends Area2D

var health = 5
var score = 0

func _physics_process(delta):
	position.y += 5


func _on_shot_body_entered(body):
	if body.name == "Ship":
		get_tree().reload_current_scene()
		health -= 1
		
	if body.name == "shot":
		queue_free()
		#health += 1
		
	if health == 0:
		get_tree().change_scene("res://GameOver.tscn")
