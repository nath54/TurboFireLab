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
		# $Menus/Bts/Bt_lancer.text = "pause"
		Physics2DServer.set_active(true)
		GlobalGame.lance=true
		GlobalGame.lance_initial = true
	else:
		# $Menus/Bts/Bt_lancer.text = "lancer"
		Physics2DServer.set_active(false)
		GlobalGame.lance=false

func _on_Bt_recommencer_pressed():
	get_tree().change_scene("res://game/game.tscn")

func _on_Bt_delete_pressed():
	if not GlobalGame.lance_initial:
		GlobalGame.is_deleting = true

func raj_el(bt, el, path):
	if GlobalGame.lance_initial:
		return
	if GlobalGame.est_placer:
		GlobalGame.img_place.queue_free()
	var r = preload("res://game/ui/sprite_place.tscn")
	GlobalGame.img_place = r.instance()
	GlobalGame.img_place.texture = bt.texture_normal
	GlobalGame.img_place.element = el
	GlobalGame.img_place.path = path
	GlobalGame.est_placer = true
	$Scene.add_child(GlobalGame.img_place)

func _on_Bt_bouger_pressed():
	GlobalGame.mode = 1
	$"Menus/Rajouter Element/HBoxContainer/txt_mode".text = "mode : bouger"

func _on_Bt_rotate_pressed():
	GlobalGame.mode = 2
	$"Menus/Rajouter Element/HBoxContainer/txt_mode".text = "mode : rotation"

func _on_bt_eau_pressed():
	raj_el($"Menus/Rajouter Element/GridContainer/Bt_eau", preload("res://game/elements/eau/GoutteEau.tscn"), "Elements/eau")

func _on_Bt_feu_pressed():
	raj_el($"Menus/Rajouter Element/GridContainer/Bt_feu", preload("res://game/elements/flamme/flamme.tscn"), "Flammes")

func _on_Bt_barre_pressed():
	raj_el($"Menus/Rajouter Element/GridContainer/Bt_barre", preload("res://game/elements/barre/barre.tscn"), "Elements/objets")

func _on_Bt_planche_pressed():
	raj_el($"Menus/Rajouter Element/GridContainer/Bt_planche", preload("res://game/elements/planche_bois/planche_bois.tscn"), "Elements/objets")

func _on_Bt_block_pressed():
	raj_el($"Menus/Rajouter Element/GridContainer/Bt_block", preload("res://game/elements/block_dur/block_dur.tscn"), "Elements/objets")
