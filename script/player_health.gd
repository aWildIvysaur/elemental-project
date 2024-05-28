extends Node
class_name PlayerHealth

var health: int = 100

func damage(amount: int):
	health -= amount
