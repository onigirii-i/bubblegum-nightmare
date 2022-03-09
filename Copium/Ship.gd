extends KinematicBody2D

var speed = 350
var velocity = Vector2()

func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
		
	move_and_slide((velocity))

	if Input.is_action_just_pressed("ui_accept"):
		fire()
		
func fire():
	var bullet = preload("res://Bullet.tscn")
	var firedBullet = bullet.instance()
	firedBullet.position = Vector2(position.x, -25)
	
	get_parent().call_deferred("add_child", firedBullet)
