extends Node

func _process(_delta):
	if Input.is_action_just_pressed("tab"):
		get_tree().change_scene("res://src/titlescreen/instruct/Instructions.tscn")
	
	#if the music is not playing, it will restart
	if ($AudioStreamPlayer.playing == false):
		$AudioStreamPlayer.play()
	
	if Input.is_action_pressed("escape"):
		get_tree().quit()
