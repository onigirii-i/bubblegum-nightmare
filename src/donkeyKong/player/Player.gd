extends KinematicBody2D

#player stats
var score : int = 0
var health = 3

#player movement values
var speed : int = 300
var jumpForce : int = 450
var gravity : int = 900
var vel : Vector2 = Vector2()


#starts three second timer
func ready():
	$playerTimer.start()

#player movement function
func _physics_process (delta):
	#resets horizontal velocity
	vel.x = 0
	
	#movement input functions
	if Input.is_action_pressed("left"):
		vel.x -= speed
		$AnimatedSprite.play()
	if Input.is_action_pressed("right"):
		vel.x += speed
		$AnimatedSprite.play()
	if Input.is_action_pressed("up") and is_on_floor():
		vel.y -= jumpForce
		$AnimatedSprite.stop()

	#extended movement functions
	vel = move_and_slide(vel, Vector2.UP)
	
	#gravity
	vel.y += gravity * delta
	
	#movement animation stops when player does not move much
	if (health == 0):
		get_tree().change_scene("res://src/donkeyKong/end scenes/DonkeyKongLose.tscn")
	$canvas_player/life_label.text = "Lives Remaining: " + str(health) + "\nScore: " + str(score)
	
	#if the escape key is pressed, the game is quit
	if Input.is_action_pressed("escape"):
		get_tree().quit()

#executes when ball and player collide
func _on_player_area_area_entered(area):
	if(area.name == "ball_area"):
		#deletes ball
		area.get_parent().queue_free()
	
		#decreases health by 1
		health -= 1
		score = 0
		#resets player position
		position.x = 512
		position.y = 550
		
	if(area.name == "portal_area"):
		get_tree().change_scene("res://src/donkeyKong/end scenes/DonkeyKongWin.tscn")

#executes when playerTimer reaches timeout
func _on_playerTimer_timeout():
	#increases score by one
	score += 1
	
	#restarts timer
	$playerTimer.start()
