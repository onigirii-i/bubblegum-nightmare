extends Node

onready var carspawn1 = preload("res://src/CarLeft.tscn")
onready var carspawn2 = preload("res://src/CarRight.tscn")

var car_time = 2
var carCount = 0

func _ready():
	$carTimer.start()

#executes when carTimer reaches 0 
func _on_carTimer_timeout():
	if (carCount < 5):
		
		#adds new car
		var new_car1 = carspawn1.instance()
		add_child(new_car1)
		var new_car2 = carspawn2.instance()
		add_child(new_car2)
	
		#restarts timer & decreases ballTimer by 1 second with minimum of 1 second
		$carTimer.start(car_time)
		carCount += 1

func _process(_delta):
	if ($AudioStreamPlayer.playing == false):
		$AudioStreamPlayer.play()
	#if the escape key is pressed, the game is quit
	if Input.is_action_pressed("escape"):
		get_tree().quit()
