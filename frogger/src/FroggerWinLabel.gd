extends Label

var var1 = 0.01
	
func _process(_delta):
	set_percent_visible(var1)
	var1 += 0.01
	#if the escape key is pressed, the game is quit
	if Input.is_action_pressed("escape"):
		get_tree().quit()
		
	#if the right arrow key is pressed, a new scene is opened
	if Input.is_action_pressed("right"):
		pass
	
	if ($AudioStreamPlayer.playing == false):
		$AudioStreamPlayer.play()
