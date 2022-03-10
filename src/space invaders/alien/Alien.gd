extends KinematicBody2D

var move_speed = 20

var shootingcount = rand_range(0,100)





func _physics_process(delta):
	var collision = move_and_collide(Vector2.DOWN * delta * move_speed)
	
	shootingcount += delta
	if shootingcount >= 100:
		var bullet = preload("res://src/space invaders/alien/AlienBullet.tscn")
		var firedbullet = bullet.instance()
		firedbullet.position = Vector2(position.x,position.y)
		
		get_parent().call_deferred("add_child", firedbullet)
		
		shootingcount = rand_range(0,100)
	
func kill():
	queue_free()
