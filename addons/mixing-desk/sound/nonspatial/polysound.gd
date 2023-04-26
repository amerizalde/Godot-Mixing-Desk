extends BaseContainer
class_name PolySound

func play(ran=true):
	for i in get_children():
		if i.name == "root": return
		if ran:
			_randomise_pitch_and_vol(i)
		_iplay(i)
