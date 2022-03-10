extends Node

func _process(_delta):
	if Input.is_action_just_pressed("tab"):
		get_tree().change_scene("res://src/titlescreen/TitleScreen.tscn")
	
	#if the music is not playing, it will restart
	if ($AudioStreamPlayer.playing == false):
		$AudioStreamPlayer.play()
	
	if Input.is_action_pressed("escape"):
		get_tree().quit()


func _on_level_2_pressed():
	get_tree().change_scene("res://src/titlescreen/instruct/level_2.tscn")


func _on_level_3_pressed():
	get_tree().change_scene("res://src/titlescreen/instruct/level_3.tscn")


func _on_level_1_pressed():
	get_tree().change_scene("res://src/titlescreen/instruct/level_1.tscn")
