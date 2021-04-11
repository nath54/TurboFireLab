extends Area2D

"""
Pour l'instant, on fera que le feu s'éteint directement
quand il touche l'eau, mais on pourra faire qu'il faut
que l'eau reste un temps déterminé minimum pour que le 
feu s'éteigne.
"""

func _on_Area2D_body_entered(body):
	"""
	On définira ici les règles de physique lorsqu'un OBJET
	rentre en collision avec la flamme
	"""
	if body.nom_element == "eau":
		GlobalGame.game.test_gagne();
		get_parent().queue_free();
	elif body.nom_element == "glacon":
		GlobalGame.game.test_gagne();
		get_parent().queue_free();
		GlobalGame.game.get_node("Succes").set_succes("j'ai froid")
	elif body.nom_element == "vapeur":
		GlobalGame.game.test_gagne();
		get_parent().queue_free();
		GlobalGame.game.get_node("Succes").set_succes("à l'état gazeux")

