extends RigidBody2D

const FACTEUR_VITESSE = 20

var est_eau = true
var effets_vent = true
var electrise = false
var est_conducteur = false
var couleur_electricite = false
var nom_objet_electrisant = ""
var nom_element = "glacon"

func _integrate_forces(state):
	var dt = state.get_step()
	var gravity = state.get_total_gravity() # The default gravity, you can use your own.
	var velocity = state.get_linear_velocity()
	state.set_linear_velocity((velocity + gravity * -1) * FACTEUR_VITESSE * dt)

func _ready():
	set_use_custom_integrator(true)
	set_friction(0)

func effet_chaud():
	var ps = preload("res://game/elements/eau/Eau.tscn")
	var eau = ps.instance()
	eau.position = position
	get_parent().add_child(eau)
	queue_free()
