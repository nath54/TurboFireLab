extends Control






func _on_Bt_play_pressed():
	get_tree().change_scene("res://game/game.tscn");


func _on_Bt_quitter_pressed():
	get_tree().quit()
