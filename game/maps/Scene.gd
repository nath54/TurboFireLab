extends Node2D

export var restants_goutte_eau : int = -1
export var restants_barre : int = -1
export var restants_flamme : int = -1
export var restants_block_dur : int = -1
export var restants_planche_bois : int = -1
export var restants_ventilateur : int = -1
export var niveau_suivant: String = "null"

func load_restants():
	GlobalGame.restants_goutte_eau = restants_goutte_eau
	GlobalGame.restants_barre = restants_barre
	GlobalGame.restants_flamme = restants_flamme
	GlobalGame.restants_block_dur = restants_block_dur
	GlobalGame.restants_planche_bois = restants_planche_bois
	GlobalGame.restants_ventilateur = restants_ventilateur

# Called when the node enters the scene tree for the first time.
func _ready():
	load_restants()
	GlobalGame.game.aff_restants()
	GlobalGame.niveau_suivant = niveau_suivant
	GlobalGame.scene_saved = null

func save_beginning():
	# var scene_root = self
	GlobalGame.scene_saved = self.duplicate()
	# _set_owner(scene_root, scene_root)
	# GlobalGame.scene_saved.pack(scene_root)

func _on_Zone_dexistence_body_exited(body):
	body.queue_free()
