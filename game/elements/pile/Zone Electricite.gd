extends Area2D

func _process(delta):
	if GlobalGame.lance:
		var nb_elec = 0
		for body in get_overlapping_bodies():
			if body.has_method("is_electrisable") and body.is_electrisable():
				if body.nom_element == "eau":
					GlobalGame.game.get_node("Datas").set_data("0")
				if body.nom_element in ["ventilateur","laser froid", "laser chaud"]:
					nb_elec += 1
				body.electrise = true
				if body.couleur_electricite:
					body.modulate = Color(0.5,0,1)
		if nb_elec >= 3:
			GlobalGame.game.get_node("Succes").set_succes("en série !")
