extends RigidBody2D

var est_eau = true
var effets_vent = true
var electrise = false
var est_conducteur = true
var couleur_electricite = true

func is_electrisable():
	return true

func _ready():
	set_friction(0)
