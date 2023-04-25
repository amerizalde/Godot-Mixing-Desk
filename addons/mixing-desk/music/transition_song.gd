extends Song

@export_node_path var target_song

func _ready():
	song_type = "transition"
	fading_out = false
	fading_in = false
	muted_tracks = []
	ignore = true
