extends AudioStreamPlayer3D

func setup():
	connect("finished", finished)

func finished():
	queue_free()
