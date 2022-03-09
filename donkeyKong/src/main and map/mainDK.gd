#extends main node
extends Node

#loads ball instance
onready var ballspawn = preload("res://src/balls/ball.tscn")

#initializes number of balls to 0 
var countBall = 0

func _ready():
	#startstimer
	$ballTimer.start()

#sets initial ball wait time to 8 seconds
var ball_time : int = 5 

#executes when ballTimer reaches 0 
func _on_ballTimer_timeout():
	
	#checks to see if there are <= 15 balls
	if (countBall <= 15):
		randomize()
	
		#adds new ball
		var new_ball = ballspawn.instance()
		add_child(new_ball)
	
		#sets random position in the top third of the map
		new_ball.position.x = rand_range(100, 924)
		new_ball.position.y = rand_range(0,100)
	
		#restarts timer & decreases ballTimer by 1 second with minimum of 1 second
		$ballTimer.start(ball_time)
		ball_time -= 1
		if (ball_time < 2):
			ball_time = 2
			
		#increments countBall
		countBall += 1

#executes every frame
func _process(_delta):
	#if the music is not playing, it will restart
	if ($AudioStreamPlayer.playing == false):
		$AudioStreamPlayer.play()
	
	#if the escape key is pressed, the game is quit
	if Input.is_action_pressed("escape"):
		get_tree().quit()
