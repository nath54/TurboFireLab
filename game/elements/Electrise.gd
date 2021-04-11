extends Area2D

var last_tick = OS.get_ticks_msec()
var tp_tick = 300

func _ready():
	last_tick = OS.get_ticks_msec()

func _process(delta):
	if OS.get_ticks_msec() - last_tick < tp_tick:
		return
	if get_parent().electrise and get_parent().est_conducteur:
		var compteur = 0
		for body in get_overlapping_bodies():
			# Pour les matériaux conducteurs
			if body.get("est_conducteur") and not body.est_conducteur:
				GlobalGame.game.get_node("Datas").set_data("10")
			if body.has_method("is_electrisable") and body.is_electrisable():
				compteur += 1
				body.nom_objet_electrisant = get_parent().nom_element
				body.electrise = true
				if body.couleur_electricite:
					body.modulate = Color(0.5,0,1)
			if compteur == -1:
				break
		if compteur >= 1:
			get_parent().electrise = false
			get_parent().modulate = Color(1,1,1)
