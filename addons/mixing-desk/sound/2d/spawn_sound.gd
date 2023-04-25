extends SpawnSound

func setup():
	connect("finished", finished)

func finished():
	queue_free()
