extends ConcatCont

func _iplay(sound):
	var snd = sound.duplicate()
	root.add_child(snd)
	if spawn_node:
		snd.position = global_position
	snd.play()
	snd.set_script(preload("res://addons/Godot-Mixing-Desk/addons/mixing-desk/sound/2d/spawn_sound.gd"))
	snd.setup()
