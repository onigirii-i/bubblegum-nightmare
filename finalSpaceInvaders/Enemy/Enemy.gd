extends KinematicBody2D

var speed = 200
var bouncing = false
var velocity = Vector2()







func _ready():
	set_physics_process(true)

func _physics_process(delta):
	
	var collision = move_and_collide(Vector2(speed * delta, 0))
	if collision:
		velocity = -speed
		
