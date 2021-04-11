extends Area2D

func _process(delta):
	if GlobalGame.lance:
		for body in get_overlapping_bodies():
			print(body)
			if body.has_node("Zone_Electricite") and body.has_method("is_electrisable") and body.is_electrisable():
				body.electrise = true
				body.modulate = Color(0.5,0,1)
			if body.has_node("Electronique"):
				body.get_node("Electronique").lancer()
