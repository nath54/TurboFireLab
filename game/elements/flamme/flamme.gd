extends Node2D

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
		
	if body.get("est_eau"):
		get_parent().get_parent().get_parent().test_gagne();
		queue_free();

