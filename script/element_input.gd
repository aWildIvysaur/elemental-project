extends Node

var Attack = load("res://scene/attack.tscn")

enum AttackType {fire, stone, lightning}

var attacks: Array = [null, null, null]
var index = 0

func _process(_delta: float):

	var attack = null
	if Input.is_action_just_pressed("elem1"):
		attack = AttackType.fire
	if Input.is_action_just_pressed("elem2"):
		attack = AttackType.stone
	if Input.is_action_just_pressed("elem3"):
		attack = AttackType.lightning

	if attack:
		attacks[index % 3] = attack
		index += 1

func try_attack(pos: Vector2):
	if index % 3 != 0:
		return
	var a = Attack.instantiate()
	var parent = get_parent()
	if attacks[0] != AttackType.fire:
		parent = parent.get_parent()
	parent.add_child(a)
	a.init(attacks[0], attacks[1], attacks[2], pos)
