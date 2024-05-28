extends CharacterBody2D
class_name Enemy

@export var target: Node
@export var SPEED: float = 400

func _physics_process(_delta: float):
	var dir = (target.global_position - global_position).normalized()
	velocity = dir * SPEED
	move_and_slide()
