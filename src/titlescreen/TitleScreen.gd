extends Control

#executes every frame
func _process(_delta):
	#if the music is not playing, it will restart
	if ($AudioStreamPlayer.playing == false):
		$AudioStreamPlayer.play()
	
	#if the escape key is pressed, the game is quit
	if Input.is_action_pressed("escape"):
		get_tree().quit()

func _on_play_button_pressed():
	get_tree().change_scene("res://src/donkeyKong/main and map/mainDK.tscn")


func _on_quit_button_pressed():
	get_tree().quit()


func _on_instruction_button_pressed():
	get_tree().change_scene("res://src/titlescreen/instruct/Instructions.tscn")


func _on_credits_button_pressed():
	get_tree().change_scene("res://src/titlescreen/Credits.tscn")
