extends RigidBody2D

var est_eau = true;
var effets_vent = true
var electrise = false
var debut_electrisation = 0


func is_electrisable():
	return true

func _ready():
	set_friction(0)



