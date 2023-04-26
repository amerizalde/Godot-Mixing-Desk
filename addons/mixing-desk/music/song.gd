@icon("res://addons/Godot-Mixing-Desk/addons/mixing-desk/music/icons/song_icon.png")
extends Node
class_name Song


#internal vars

var song_type = "standard"
var fading_out : bool = false
var fading_in : bool = false
var muted_tracks = []
var concats : Array
var playing = false

#external properties
@export var ignore := false

@export var tempo : int
@export var bars : int
@export var beats_in_bar : int
@export var transition_beats : float
@export var auto_transition : bool
@export_node_path var auto_signal_node
@export var auto_signal : String
@export_enum("Beat", "Bar") var transition_type : String
@export var bus := "Music"


func _ready():
	if auto_transition:
		var sig_node = get_node(auto_signal_node)
		sig_node.connect(auto_signal, _transition(transition_type))
	var busnum = AudioServer.get_bus_index(bus)
	if busnum == -1:
		AudioServer.add_bus(AudioServer.bus_count)
		AudioServer.set_bus_name(AudioServer.bus_count - 1, bus)
		if bus != "Music":
			AudioServer.set_bus_send(AudioServer.get_bus_index(bus),"Music")
	for i in get_children():
		for o in i.get_children():
			o.set_bus(bus)

func _transition(type):
	match type:
		"Beat":
			get_parent().queue_beat_transition(name)
		"Bar":
			get_parent().queue_bar_transition(name)

func _get_core():
	for i in get_children():
		if i.cont == "core":
			return i
