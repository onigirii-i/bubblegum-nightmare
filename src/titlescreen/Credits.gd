extends Node

func _process(_delta):
	if Input.is_action_pressed("tab"):
		get_tree().change_scene("res://src/titlescreen/TitleScreen.tscn")
	
	#if the music is not playing, it will restart
	if ($AudioStreamPlayer.playing == false):
		$AudioStreamPlayer.play()
		
	#if the escape key is pressed, the game is quit
	if Input.is_action_pressed("escape"):
		get_tree().quit()
