extends Control

func _on_Bt_play_pressed():
	$VBoxContainer/Niveaux.visible = not $VBoxContainer/Niveaux.visible

func _on_Bt_quitter_pressed():
	get_tree().quit()

func _on_Bt_niveau_1_pressed():
	GlobalGame.niveau_encours = "res://game/maps/Niveau_1.tscn"
	get_tree().change_scene("res://game/game.tscn")

func _on_Bt_jeu_libre_pressed():
	GlobalGame.niveau_encours = "res://game/maps/Scene.tscn"
	get_tree().change_scene("res://game/game.tscn")
