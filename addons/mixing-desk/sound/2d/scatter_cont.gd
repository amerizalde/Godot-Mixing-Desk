extends ScatterCont

var dlocs = []
@export var scatter_range : float = 1.0

func _ready():
	super._ready()
	for i in get_children():
		dlocs.append(i.position)

func _iplay(sound):
	var snd = sound.duplicate()
	root.add_child(snd)
	if spawn_node:
		snd.position = global_position
	snd.play()
	snd.set_script(preload("res://addons/Godot-Mixing-Desk/addons/mixing-desk/sound/2d/spawn_sound.gd"))
	snd.setup()

func _get_ransnd(ran=true):
	var chance = randi() % soundlist.size()
	var ransnd = soundlist[chance]
	if ran:
		_randomise(ransnd)
	return ransnd

func _randomise(sound):
	var dvol = dvols[sound.get_index()]
	var dpitch = dpitches[sound.get_index()]
	var dloc = dlocs[sound.get_index()]
	var newvol = (dvol + _range(volume_range))
	var newpitch = (dpitch + _range(pitch_range))
	var newloc = (dloc + Vector2(_range(scatter_range), _range(scatter_range)))
	sound.volume_db = newvol
	sound.pitch_scale = newpitch
	sound.position = newloc
