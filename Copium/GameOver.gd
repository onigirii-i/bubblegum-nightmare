extends Label


	
func _process(delta):
	
	#if the escape key is pressed, the game is quit
	if Input.is_action_pressed("esc"):
		get_tree().quit()
		
	#if the right arrow key is pressed, a new scene is opened
	if Input.is_action_pressed("ui_right"):
		pass
		
	if ($AudioStreamPlayer.playing == false):
		$AudioStreamPlayer.play()
