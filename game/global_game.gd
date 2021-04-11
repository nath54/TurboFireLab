extends Node

var lance = false
var lance_initial = false
var is_deleting = false
var est_placer = false
var img_place = null
var mode = 1 # 1 = bouger , 2 = rotation, 3 = agrandissement

var niveau_encours = null
var niveau_suivant = "null"

var max_x = 1000
var max_y = 530

var restants_goutte_eau = -1
var restants_barre = -1
var restants_flamme = -1
var restants_block_dur = -1
var restants_planche_bois = -1
var restants_ventilateur = -1

var game = null

var scene_saved = null
