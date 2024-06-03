extends CharacterBody2D
class_name Enemy

@export var target: Node
@export var speed: float = 400

@export var attack_range: float = 50

func _physics_process(_delta: float):
	if target == null:
		return

	var v = target.global_position - global_position
	var dist = v.length()
	var dir = v.normalized()
	velocity = dir * speed
	move_and_slide()

	if dist < attack_range:
		var health = target.get_node("Health")
		if health:
			health.damage(1)
