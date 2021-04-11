extends Node2D

var menu_encours = "console"

func on_music_intro_finished():
	Music.jouer("res://res/musics/menuboucle.ogg", true, null)

func _ready():
	$Menus/Bts/Bt_lancer/Label.text = "Lancer la simulation"
	var on_finished = FuncRef.new()
	on_finished.set_function("on_music_intro_finished")
	Music.jouer("res://res/musics/menuintro.ogg", false, on_finished)
	$Panel.visible = true
	$AnimationPlayer.play("fondu")
	GlobalGame.game = self
	if GlobalGame.niveau_encours != null:
		var packed_scene = load(GlobalGame.niveau_encours)
		var s = packed_scene.instance()
		add_child(s)
		move_child(s, 0)
	else:
		pass
	$"Menus/Menu_elements/VBoxContainer/selected_bouger".visible = true
	$"Menus/Menu_elements/VBoxContainer/selected_rotate".visible = false
	$"Menus/Menu_elements/VBoxContainer/selected_scale".visible = false
	GlobalGame.is_deleting = false
	GlobalGame.est_placer = false
	GlobalGame.img_place = null
	GlobalGame.mode = 1
	GlobalGame.lance=false
	GlobalGame.lance_initial=false
	Physics2DServer.set_active(false)
	#
	console_mes("> System loading ...")
	console_mes("> Loading complete.")
	console_mes("Bienvenue dans ce jeu !")
	console_mes("Le but de ce jeu est d'éteindre le feu dans la scène de diverses manières, mais surtout, le principal, c'est de vous amuser avec les objets a votre disposition.")
	console_mes("Bonne partie !")
	# On s'occupe des succes
	$Succes.load_succes()
	$Succes.aff_succes()
	# On s'occupe des datas
	$Datas.load_data()
	$Datas.aff_data()

func test_gagne():
	# Cette méthode est appelée lorsqu'on éteint une flamme
	# On regarde le nombre de flammes qu'il nous reste
	# On doit faire -1 car on appelle la fonction avant de supprimer la flamme
	if GlobalGame.scene.get_node("Flammes").get_child_count()-1 <= 0:
		# S'il n'y en a plus, on a gagné 
		console_mes("Bip.")
		console_mes("Bip.")
		console_mes("Le feu a été eteint")
		console_mes("Vous pouvez recommencer en appuyant sur le bouton reset.")
		# get_tree().change_scene("res://menus/MenuGagne.tscn")
	# Sinon, on ne fait rien

func _on_Bt_lancer_pressed():
	GlobalGame.scene.save_beginning()
	if not GlobalGame.lance:
		$Menus/Bts/Bt_lancer/Label.text = "Mettre en pause"
		# $Menus/Bts/Bt_lancer.text = "pause"
		Physics2DServer.set_active(true)
		GlobalGame.lance=true
		GlobalGame.lance_initial = true
	else:
		$Menus/Bts/Bt_lancer/Label.text = "Lancer la simulation"
		# $Menus/Bts/Bt_lancer.text = "lancer"
		Physics2DServer.set_active(false)
		GlobalGame.lance=false

func _on_Bt_recommencer_pressed():
	get_tree().change_scene("res://game/game.tscn")

func _on_Bt_delete_pressed():
	if GlobalGame.is_deleting:
		GlobalGame.is_deleting = false
	if not GlobalGame.lance_initial:
		GlobalGame.is_deleting = true
	$"Menus/Menu_elements/VBoxContainer/selected_delete".visible = GlobalGame.is_deleting

func console_mes(message):
	var mes = Label.new()
	mes.text = message
	mes.autowrap = true
	mes.rect_min_size = Vector2(800,20)
	mes.add_font_override("font", load("res://res/font/rainyhearts_2.tres"))
	var cont = $Menus/Console/Console/ScrollContainer
	$Menus/Console/Console/ScrollContainer/Console_Messages.add_child(mes)
	cont.scroll_vertical=cont.rect_size.y
	if not menu_encours == "console":
		$Menus/Console/Bt_console/Alert.visible = true
	

func _on_Bt_restart_pressed():
	load_from_begining()

func load_from_begining():
	if GlobalGame.scene_saved != null:
		GlobalGame.scene.queue_free()
		# 
		$"Menus/Menu_elements/VBoxContainer/selected_bouger".visible = true
		$"Menus/Menu_elements/VBoxContainer/selected_rotate".visible = false
		$"Menus/Menu_elements/VBoxContainer/selected_scale".visible = false
		$Menus/Bts/Bt_lancer/Label.text = "Lancer la simulation"
		GlobalGame.is_deleting = false
		GlobalGame.est_placer = false
		GlobalGame.img_place = null
		GlobalGame.mode = 1
		GlobalGame.lance=false
		GlobalGame.lance_initial=false
		Physics2DServer.set_active(false)
		var s = GlobalGame.scene_saved
		s.set_name("Scene")
		add_child(s)
		move_child(s, 0)

func aff_restants():
	var lst_restants = [
		["Menus/Menu_elements/GridContainer/Bt_eau/Restants_eau", GlobalGame.restants_goutte_eau],
		["Menus/Menu_elements/GridContainer/Bt_feu/Restants_feu", GlobalGame.restants_flamme],
		["Menus/Menu_elements/GridContainer/Bt_barre/Restants_barre", GlobalGame.restants_barre],
		["Menus/Menu_elements/GridContainer/Bt_block/Restants_blocks", GlobalGame.restants_block_dur],
		["Menus/Menu_elements/GridContainer/Bt_planche/Restants_planche", GlobalGame.restants_planche_bois],
		["Menus/Menu_elements/GridContainer/Bt_ventilateur/Restants_ventilo", GlobalGame.restants_ventilateur],
		["Menus/Menu_elements/GridContainer/Bt_pile/Restants_pile", GlobalGame.restants_pile],
	]
	for l in lst_restants:
		var element = get_node(l[0])
		if element == null:
			continue
		var variable = l[1]
		if variable == -1:
			element.text = ""
		else:
			element.text = str(variable)
			if variable == 0:
				element.modulate = Color(1,0,0)
			else:
				element.modulate = Color(1,1,1)

func _on_Bt_bouger_pressed():
	GlobalGame.mode = 1
	$"Menus/Menu_elements/VBoxContainer/selected_bouger".visible = true
	$"Menus/Menu_elements/VBoxContainer/selected_rotate".visible = false
	$"Menus/Menu_elements/VBoxContainer/selected_scale".visible = false

func _on_Bt_rotate_pressed():
	GlobalGame.mode = 2
	$"Menus/Menu_elements/VBoxContainer/selected_bouger".visible = false
	$"Menus/Menu_elements/VBoxContainer/selected_rotate".visible = true
	$"Menus/Menu_elements/VBoxContainer/selected_scale".visible = false

func _on_Bt_scale_pressed():
	GlobalGame.mode = 3
	$"Menus/Menu_elements/VBoxContainer/selected_bouger".visible = false
	$"Menus/Menu_elements/VBoxContainer/selected_rotate".visible = false
	$"Menus/Menu_elements/VBoxContainer/selected_scale".visible = true


func _on_Bt_console_pressed():
	menu_encours = "console"
	$Menus/Console/Bt_console/Alert.visible = false
	$Menus/Console/Console.visible = true
	$Menus/Console/Succes.visible = false
	$Menus/Console/Data.visible = false
	$Menus/Console/Menu.visible = false
	$Menus/Console/Bt_console.modulate = Color(0,1,0)
	$Menus/Console/Bt_succes.modulate = Color(1,1,1)
	$Menus/Console/Bt_data.modulate = Color(1,1,1)
	$Menus/Console/Bt_menu.modulate = Color(1,1,1)

func _on_Bt_succes_pressed():
	menu_encours = "succes"
	$Menus/Console/Console.visible = false
	$Menus/Console/Succes.visible = true
	$Menus/Console/Data.visible = false
	$Menus/Console/Menu.visible = false
	$Menus/Console/Bt_console.modulate = Color(1,1,1)
	$Menus/Console/Bt_succes.modulate = Color(0,1,0)
	$Menus/Console/Bt_data.modulate = Color(1,1,1)
	$Menus/Console/Bt_menu.modulate = Color(1,1,1)

func _on_Bt_data_pressed():
	menu_encours = "data"
	$Menus/Console/Console.visible = false
	$Menus/Console/Succes.visible = false
	$Menus/Console/Data.visible = true
	$Menus/Console/Menu.visible = false
	$Menus/Console/Bt_console.modulate = Color(1,1,1)
	$Menus/Console/Bt_succes.modulate = Color(1,1,1)
	$Menus/Console/Bt_data.modulate = Color(0,1,0)
	$Menus/Console/Bt_menu.modulate = Color(1,1,1)

func _on_Bt_menu_pressed():
	menu_encours = "menu"
	$Menus/Console/Console.visible = false
	$Menus/Console/Succes.visible = false
	$Menus/Console/Data.visible = false
	$Menus/Console/Menu.visible = true
	$Menus/Console/Bt_console.modulate = Color(1,1,1)
	$Menus/Console/Bt_succes.modulate = Color(1,1,1)
	$Menus/Console/Bt_data.modulate = Color(1,1,1)
	$Menus/Console/Bt_menu.modulate = Color(0,1,0)

func _on_Bt_credits_pressed():
	get_tree().change_scene("res://menus/Credits.tscn")

func _on_Bt_quitter_pressed():
	get_tree().quit()

func raj_el(bt, el, path, variable_to_reduce):
	if GlobalGame.lance_initial:
		return
	if GlobalGame.est_placer:
		GlobalGame.img_place.queue_free()
	Music.sfx("res://res/sounds/pointer.wav")
	var r = preload("res://game/ui/sprite_place.tscn")
	GlobalGame.img_place = r.instance()
	GlobalGame.img_place.texture = bt.texture_normal
	GlobalGame.img_place.element = el
	GlobalGame.img_place.path = path
	GlobalGame.img_place.variable_to_reduce = variable_to_reduce
	GlobalGame.est_placer = true
	GlobalGame.scene.add_child(GlobalGame.img_place)

func _on_bt_eau_pressed():
	if GlobalGame.restants_goutte_eau == -1 or GlobalGame.restants_goutte_eau >= 1:
		raj_el($"Menus/Menu_elements/GridContainer/Bt_eau", preload("res://game/elements/eau/GoutteEau.tscn"), "Elements/eau", "restants_goutte_eau")

func _on_Bt_feu_pressed():
	if GlobalGame.restants_flamme == -1 or GlobalGame.restants_flamme >= 1:
		raj_el($"Menus/Menu_elements/GridContainer/Bt_feu", preload("res://game/elements/flamme/flamme.tscn"), "Flammes", "restants_flamme")

func _on_Bt_barre_pressed():
	if GlobalGame.restants_barre == -1 or GlobalGame.restants_barre >= 1:
		raj_el($"Menus/Menu_elements/GridContainer/Bt_barre", preload("res://game/elements/barre/barre.tscn"), "Elements/objets", "restants_barre")

func _on_Bt_block_pressed():
	if GlobalGame.restants_block_dur == -1 or GlobalGame.restants_block_dur >= 1:
		raj_el($"Menus/Menu_elements/GridContainer/Bt_block", preload("res://game/elements/block_dur/block_dur.tscn"), "Elements/objets", "restants_block_dur")

func _on_Bt_planche_pressed():
	if GlobalGame.restants_planche_bois == -1 or GlobalGame.restants_planche_bois >= 1:
		raj_el($"Menus/Menu_elements/GridContainer/Bt_planche", preload("res://game/elements/planche_bois/planche_bois.tscn"), "Elements/objets", "restants_planche_bois")

func _on_Bt_ventilateur_pressed():
	if GlobalGame.restants_ventilateur == -1 or GlobalGame.restants_ventilateur >= 1:
		raj_el($"Menus/Menu_elements/GridContainer/Bt_ventilateur", preload("res://game/elements/ventilateur/Ventilateur.tscn"), "Elements/objets", "restants_ventilateur")

func _on_Bt_pile_pressed():
	if GlobalGame.restants_ventilateur == -1 or GlobalGame.restants_ventilateur >= 1:
		raj_el($"Menus/Menu_elements/GridContainer/Bt_pile", preload("res://game/elements/pile/Pile.tscn"), "Elements/objets", "restants_pile")

func _on_Bt_laser_froid_pressed():
	if GlobalGame.restants_laser_froid == -1 or GlobalGame.restants_laser_froid >= 1:
		raj_el($"Menus/Menu_elements/GridContainer/Bt_laser_froid", preload("res://game/elements/laser_froid/Laser_froid.tscn"), "Elements/objets", "restants_laser_froid")

func _on_Bt_laser_chaud_pressed():
	if GlobalGame.restants_laser_chaud == -1 or GlobalGame.restants_laser_chaud >= 1:
		raj_el($"Menus/Menu_elements/GridContainer/Bt_laser_chaud", preload("res://game/elements/laser_chaud/Laser_chaud.tscn"), "Elements/objets", "restants_laser_chaud")

func _on_Bt_seau_pressed():
	if GlobalGame.restants_seau == -1 or GlobalGame.restants_seau >= 1:
		raj_el($"Menus/Menu_elements/GridContainer/Bt_seau", preload("res://game/elements/seau/Seau.tscn"), "Elements/objets", "restants_seau")

func _on_HSlider_value_changed(value:float):
	Music.volume_db = -80 + value
	Music.get_node("Effets").volume_db = -80 + value
