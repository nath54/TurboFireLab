extends RigidBody2D

const FACTEUR_VITESSE = 20

var est_eau = true
var effets_vent = true
var electrise = false
var est_conducteur = false
var couleur_electricite = false
var nom_objet_electrisant = ""
var nom_element = "glacon"

func _ready():
	set_friction(0.1)

func effet_chaud():
	var ps = preload("res://game/elements/eau/Eau.tscn")
	var eau = ps.instance()
	eau.position = position
	get_parent().add_child(eau)
	queue_free()
	GlobalGame.game.get_node("Datas").set_data("8")
