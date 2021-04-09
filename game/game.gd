extends Node2D


func _ready():
	GlobalGame.lance=false
	GlobalGame.lance_initial=false
	Physics2DServer.set_active(false)

func test_gagne():
	# Cette méthode est appelée lorsqu'on éteint une flamme
	# On regarde le nombre de flammes qu'il nous reste
	# On doit faire -1 car on appelle la fonction avant de supprimer la flamme
	if $Scene/Flammes.get_child_count()-1 <= 0:
		# S'il n'y en a plus, on a gagné 
		get_tree().change_scene("res://menus/MenuGagne.tscn")
	# Sinon, on ne fait rien

func _on_Bt_lancer_pressed():
	if not GlobalGame.lance:
		$Menus/Bt_lancer.text = "pause"
		Physics2DServer.set_active(true)
		GlobalGame.lance=true
		GlobalGame.lance_initial = true
	else:
		$Menus/Bt_lancer.text = "lancer"
		Physics2DServer.set_active(false)
		GlobalGame.lance=false

func _on_Bt_recommencer_pressed():
	get_tree().change_scene("res://game/game.tscn")


func _on_Bt_delete_pressed():
	if not GlobalGame.lance_initial:
		GlobalGame.is_deleting = true
