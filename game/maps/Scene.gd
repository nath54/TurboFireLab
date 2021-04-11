extends Node2D

export var restants_goutte_eau : int = -1
export var restants_barre : int = -1
export var restants_flamme : int = -1
export var restants_block_dur : int = -1
export var restants_planche_bois : int = -1
export var restants_ventilateur : int = -1
export var restants_pile : int = -1
export var restants_laser_chaud : int = -1
export var restants_laser_froid : int = -1
export var restants_seau : int = -1
export var niveau_suivant: String = "null"

func load_restants():
	GlobalGame.restants_goutte_eau = restants_goutte_eau
	GlobalGame.restants_barre = restants_barre
	GlobalGame.restants_flamme = restants_flamme
	GlobalGame.restants_block_dur = restants_block_dur
	GlobalGame.restants_planche_bois = restants_planche_bois
	GlobalGame.restants_ventilateur = restants_ventilateur
	GlobalGame.restants_pile = restants_pile
	GlobalGame.restants_laser_froid = restants_laser_froid
	GlobalGame.restants_laser_chaud = restants_laser_chaud
	GlobalGame.restants_seau = restants_seau

# Called when the node enters the scene tree for the first time.
func _ready():
	load_restants()
	GlobalGame.game.aff_restants()
	GlobalGame.niveau_suivant = niveau_suivant
	GlobalGame.scene_saved = null
	GlobalGame.scene = self

func save_beginning():
	# var scene_root = self
	GlobalGame.scene_saved = self.duplicate()
	# _set_owner(scene_root, scene_root)
	# GlobalGame.scene_saved.pack(scene_root)

func _on_Zone_dexistence_body_exited(body):
	body.queue_free()
