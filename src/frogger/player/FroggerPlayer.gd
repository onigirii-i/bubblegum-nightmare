extends Area2D
var score = 0
var health = 3

func _ready():
	position.x = 512
	position.y = 573

func _process(_delta):
	if Input.is_action_just_pressed("left"):
		position.x -= 64
		$AnimatedSprite.play()
	if Input.is_action_just_pressed("right"):
		position.x += 64
		$AnimatedSprite.play()
	if Input.is_action_just_pressed("up"):
		position.y -= 64
		score += health
		$AnimatedSprite.stop()
	if Input.is_action_just_pressed("down"):
		position.y += 64
		score -= health
		$AnimatedSprite.stop()
	$playerCanvas/life_label.text = "Lives Remaining: " + str(health) + "\nScore: " + str(score)
	if (health == 0):
		get_tree().change_scene("res://src/frogger/end scenes/FroggerLose.tscn")
	
	#if the escape key is pressed, the game is quit
	if Input.is_action_pressed("escape"):
		get_tree().quit()


func _on_Area2D_area_entered(area):
	if(area.name == "car_area" or area.name == "car_area2" or area.name == "car_area3" or area.name == "car_area4"):
		position.x = 512
		position.y = 573
		health -= 1
		score = 0
	if(area.name == "finish_area"):
		get_tree().change_scene("res://src/frogger/end scenes/FroggerWin.tscn")
