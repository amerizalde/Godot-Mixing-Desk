extends MultiSound

func _ready():
	for i in get_children():
		i.spawn_node = spawn_node
	if autoplay:
		play()
