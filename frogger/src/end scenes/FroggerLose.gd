extends Node

#initalizes variable
var var1 = 0.01

#executes every frame	
func _process(_delta):
	
	#sets the percent of the label visible to var1
	$Label.set_percent_visible(var1)
	$Label2.set_percent_visible(var1)
	
	#increases the value of var1 every frame
	var1 += 0.01
	
	#if left is pressed, the DKmain scene is opened and level can be retried
	if Input.is_action_pressed("left"):
		get_tree().change_scene("res://src/main/FroggerMain.tscn")
		
	#if right is pressed, the next scene is opened
	if Input.is_action_pressed("right"):
		pass
		
	#if the escape key is pressed, the game is quit
	if Input.is_action_pressed("escape"):
		get_tree().quit()
		
	#if the music is not playing, it will restart
	if ($AudioStreamPlayer.playing == false):
		$AudioStreamPlayer.play()
