extends Node2D

var var1 = 0.01
	
#executes every frame	
func _process(_delta):
	
	#sets the percent of the label visible to var1
	$Label.set_percent_visible(var1)
	$Label2.set_percent_visible(var1)
	
	#increases the value of var1 every frame
	var1 += 0.01
	
	#if left is pressed, the SImain scene is opened and level can be retried
	if Input.is_action_pressed("tab"):
		get_tree().change_scene("res://src/space invaders/main and map/World.tscn")
	
	#if the escape key is pressed, the game is quit
	if Input.is_action_pressed("esc"):
		get_tree().quit()
		
	#if the right arrow key is pressed, a new scene is opened
	if Input.is_action_pressed("enter"):
		get_tree().change_scene("res://src/titlescreen/TitleScreen.tscn")
		
	if ($AudioStreamPlayer2D.playing == false):
		$AudioStreamPlayer2D.play()
