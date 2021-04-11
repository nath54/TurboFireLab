extends Control

func _ready():
	$VBoxContainer/HBoxContainer/Bt_suivant.visible = GlobalGame.niveau_suivant != "null"

func _on_Bt_Menu_pressed():
	get_tree().change_scene("res://menus/MainMenu.tscn");

func _on_Bt_recommencer_pressed():
	get_tree().change_scene("res://game/game.tscn");

func _on_Bt_suivant_pressed():
	if GlobalGame.niveau_suivant != "null":
		GlobalGame.niveau_encours = GlobalGame.niveau_suivant
		get_tree().change_scene("res://game/game.tscn")
