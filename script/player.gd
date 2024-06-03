extends CharacterBody2D
class_name Player

const SPEED = 700
const ACCELERATION = 0.8

var attack = load("res://scene/player_attack.tscn")

func _physics_process(_delta: float):
	# Normalized input vector, ensures strafing is not faster than moving forward
	var input = Input.get_vector("left", "right", "up", "down").normalized()
	# Update velocity by lerping towards (input × speed)
	velocity = lerp(velocity, input * SPEED, ACCELERATION)
	# Apply velocity
	move_and_slide()
	
	if Input.is_action_just_pressed("attack"):
		make_attack("fire" , "fire", "fire")
	
func make_attack(element1:String, element2:String, element3:String):
	var a = attack.instantiate()
	if element1 != "stone":
		add_child(a)
	else:
		get_parent().add_child(a)
	a.init(element1, element2, element3, get_global_mouse_position())
	

		
		
