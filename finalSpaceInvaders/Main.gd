extends Node2D

func _process(_delta):
	#if the music is not playing, it will restart
	if ($AudioStreamPlayer2D.playing == false):
		$AudioStreamPlayer2D.play()

