extends Area2D

export (int) var speed = 150

var health = 1

func _physics_process(delta):
	global_position.y += speed * delta
	
func take_damage(damage):
	health -= damage
	
	if health <= 0:
		queue_free()

func _on_Enemy_area_entered(area):
	if area is Player1:
		area.take_damage(1)
