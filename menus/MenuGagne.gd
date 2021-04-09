extends Control

func _on_Bt_Menu_pressed():
	get_tree().change_scene("res://menus/MainMenu.tscn");

func _on_Bt_recommencer_pressed():
	get_tree().change_scene("res://game/game.tscn");
