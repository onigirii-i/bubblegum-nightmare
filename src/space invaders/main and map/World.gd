extends Node2D


	

func _process(_delta):
	#if the music is not playing, it will restart
	if $AudioStreamPlayer2D.playing == false:
		$AudioStreamPlayer2D.play()
#if the escape key is pressed, the game is quit
	if Input.is_action_pressed("esc"):
		get_tree().quit()
