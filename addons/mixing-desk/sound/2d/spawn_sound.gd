extends AudioStreamPlayer2D

func setup():
	connect("finished", finished)

func finished():
	queue_free()
