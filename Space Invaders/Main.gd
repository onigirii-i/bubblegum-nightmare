extends Node2D

var Laser = preload("res://characters/player/PlayerLaser.tscn")

func _on_Player_spawn_laser(location):
	var l = Laser.instance()
	l.global_position = location
	add_child(l)
