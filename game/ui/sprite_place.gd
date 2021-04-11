extends Sprite

var tile = 64
var element = null
var path = "Elements"
var variable_to_reduce = null

func _process(delta):
	var p = get_global_mouse_position()
	var x = p[0]
	var y = p[1]
	# var x = p[0] - int(p[0]) % tile
	# var y = p[1] - int(p[1]) % tile
	position = Vector2(x, y)

func _input(event):
	if event is InputEventMouseButton:
		print(position)
		if position.x > 0 and position.x < GlobalGame.max_x and position.y > 0 and position.y < GlobalGame.max_y:
			var i = GlobalGame.img_place.element.instance()
			i.position = position
			get_parent().get_node(path).add_child(i)
			GlobalGame.img_place = null
			GlobalGame.est_placer = false
			if GlobalGame.get(variable_to_reduce) >= 1:
				GlobalGame.set(variable_to_reduce, GlobalGame.get(variable_to_reduce) - 1)
			GlobalGame.game.aff_restants()
			queue_free()
