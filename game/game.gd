extends Node2D



func test_gagne():
	# Cette méthode est appelée lorsqu'on éteint une flamme
	# On regarde le nombre de flammes qu'il nous reste
	# On doit faire -1 car on appelle la fonction avant de supprimer la flamme
	if $Scene/Flammes.get_child_count()-1 <= 0:
		# debug
		print("GAGNE")
		# S'il n'y en a plus, on a gagné
		get_tree().change_scene("res://menus/MenuGagne.tscn");
	# Sinon, on ne fait rien

