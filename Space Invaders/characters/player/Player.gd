extends Area2D

class_name Player1

var speed = 300

var input_vector = Vector2.ZERO


onready var muzzle = $Muzzle
signal spawn_laser(location)
var health = 5

func _physics_process(delta):
	
	input_vector.x = Input.get_action_strength("move_right") -  Input.get_action_strength("move_left")
	input_vector.y = Input.get_action_strength("move_down") -  Input.get_action_strength("move_up")
	
	global_position += input_vector * speed * delta
	
	if Input.is_action_just_pressed("shoot"):
		shoot_laser()


func take_damage(damage):
	health -= damage
	
	if health <= 0:
		queue_free()
		
func _on_Player_area_entered(area):
	if area.is_in_group("enemies"):
		area.take_damage(1)

func shoot_laser():
	emit_signal("spawn_laser", muzzle.global_position)
