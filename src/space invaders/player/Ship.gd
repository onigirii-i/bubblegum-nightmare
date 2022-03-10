extends KinematicBody2D

var health = 5
var score = 0
var speed = 350
var velocity = Vector2()

func ready():
	$player_timer.start()
	$enemy_timer.start()

func _physics_process(_delta):
	if Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
		
	move_and_slide((velocity))

	if Input.is_action_just_pressed("ui_accept"):
		fire()
	
	if (health == 0):
		get_tree().change_scene("res://src/space invaders/end scenes/GameOver.tscn")
	$CanvasLayer/Label.text = "Lives Remaining: " + str(health) + "\nScore: " + str(score)
	if Input.is_action_pressed("escape"):
		get_tree().quit()
	
func fire():
	var bullet = preload("res://src/space invaders/player/Bullet.tscn")
	var firedBullet = bullet.instance()
	firedBullet.position = Vector2(position.x, -25)
	
	get_parent().call_deferred("add_child", firedBullet)


func _on_Area2D_area_entered(area):
	if (area.name == "shot"):
		health -= 1
		area.get_parent().queue_free()
		score = 0


func _on_player_timer_timeout():
	score += 1


func _on_enemy_timer_timeout():
	get_tree().change_scene("res://src/space invaders/end scenes/GamePassed.tscn")
