extends RigidBody2D

var est_eau = true
var effets_vent = true
var electrise = false
var est_conducteur = true
var couleur_electricite = true
var nom_objet_electrisant = ""
var nom_element = "eau"

func is_electrisable():
	return true

func _ready():
	set_friction(0)

func effet_chaud():
	var ps = load("res://game/elements/vapeur/vapeur.tscn")
	var vap = ps.instance()
	vap.position = position
	get_parent().add_child(vap)
	queue_free()

func effet_froid():
	var ps = load("res://game/elements/glacon/glacon.tscn")
	var glac = ps.instance()
	glac.position = position
	get_parent().add_child(glac)
	queue_free()
	GlobalGame.game.get_node("Datas").set_data("7")
