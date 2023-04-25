extends PolySound

func _iplay(sound):
	var snd = sound.duplicate()
	root.add_child(snd)
	if spawn_node:
		snd.position = global_position
	snd.play()
	snd.set_script(preload("res://addons/Godot-Mixing-Desk/addons/mixing-desk/sound/2d/spawn_sound.gd"))
	snd.setup()

func play(ran=true):
	for i in get_children():
		if i.name == "root": return
		if ran:
			_randomise(i)
		_iplay(i)

func _randomise(sound):
	var dvol = dvols[sound.get_index()]
	var dpitch = dpitches[sound.get_index()]
	var newvol = (dvol + _range(volume_range))
	var newpitch = (dpitch + _range(pitch_range))
	sound.volume_db = newvol
	sound.pitch_scale = newpitch

func _range(item : float) -> float:
	return randf_range(-item,item)
