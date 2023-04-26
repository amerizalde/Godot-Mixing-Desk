extends Node2D
class_name BaseContainer

var dvols = []
var dpitches = []
var soundlist = []
var root
@export_node_path var spawn_node
@export var autoplay : bool
@export var volume_range : float
@export var pitch_range : float
@export var sound_number : int

func _ready():
	for i in get_children():
		dvols.append(i.volume_db)
		dpitches.append(i.pitch_scale)
		soundlist.append(i)
	if spawn_node:
		if typeof(spawn_node) == TYPE_NODE_PATH:
			root = get_node(spawn_node)
		elif typeof(spawn_node) == TYPE_OBJECT:
			root = spawn_node
	else:
		root = Node2D.new()
		add_child(root)
		root.name = "root"
	if autoplay:
		play()

func play():
	pass

func stop():
	for i in root.get_children():
		i.queue_free()

func _iplay(sound):
	var snd = sound.duplicate()
	root.add_child(snd)
	snd.play()
	snd.set_script(preload("res://addons/Godot-Mixing-Desk/addons/mixing-desk/sound/nonspatial/spawn_sound.gd"))
	snd.setup()

func _get_ransnd(ran=true):
	var chance = randi() % soundlist.size()
	var ransnd = soundlist[chance]
	if ran:
		_randomise_pitch_and_vol(ransnd)
	return ransnd

func _randomise_pitch_and_vol(sound):
	var dvol = sound.get_parent().dvols[sound.get_index()]
	var dpitch = sound.get_parent().dpitches[sound.get_index()]
	var newvol = (dvol + randf_range(-volume_range,volume_range))
	var newpitch = (dpitch + randf_range(-pitch_range,pitch_range))
	sound.volume_db = newvol
	sound.pitch_scale = newpitch
