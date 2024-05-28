extends Node

@export var enemy: PackedScene = preload ("res://scene/enemy.tscn")

func _physics_process(_delta: float):
	if randf() < 0.01:
		assert(enemy != null, "enemy scene not loaded")
		var e = enemy.instantiate()
		e.position = Vector2(randf_range( - 500, 500), randf_range( - 300, 300))
		e.target = %Player
		e.scale = Vector2(0.5, 0.5)
		get_parent().add_child(e)
