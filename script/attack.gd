extends Node

var timedict = { 
	"fire": 2000, 
	"stone": 3000, 
	"lightning": 1000, 
}

var sizedict = {
	"fire": 0.5,
	"stone": 1.0,
	"lightning": 1.5,
}

var dmultdict = {
	"fire": 0.5,
	"stone": 1.0,
	"lightning": 1.5,
}

var areadict = {
	"fire": $FireArea2D,
	"stone": $EarthArea2D,
	"lightning": $LightningArea2D,
}

var collider: Area2D
var time_till_damage:int
var collider_size_mult:float
var damage_mult:float
var damage_type:String
var pos_start: Vector2
var pos_end: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func init(area_mod:String, time_mod:String, damage_mod:String, player_pos: Vector2, mos_pos: Vector2,
	 	  player_rotation:int):
	#region Get Derivatives
	collider = areadict[area_mod]
	time_till_damage = timedict[time_mod]
	collider_size_mult = sizedict[time_mod]
	damage_mult = dmultdict[damage_mod]
	damage_type = damage_mod
	pos_start = player_pos
	pos_end = mos_pos
	#endregion
	collider.visible = true
	
	if area_mod == "fire":
		collider.rotation = player_rotation
		collider.position= pos_start
	elif area_mod == "stone":
		collider.position = pos_end
	elif area_mod == "lightning":
		collider.rotation = player_rotation
		collider.position= pos_start
