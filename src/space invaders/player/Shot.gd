extends KinematicBody2D

var move_speed = 200
var Life_time = 2
var Life_spawn = 0

func _physics_process(delta):
	
	var collision = move_and_collide(Vector2.UP * delta * move_speed)
	
	if collision and collision.collider.has_method("kill"):
		collision.collider.kill()
		queue_free()
	
	Life_spawn += delta
	if Life_spawn > Life_time:
		queue_free()
