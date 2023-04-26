extends BaseContainer
class_name RanCont

func play(num=0, ran=true):
	if num == 0:
		num = sound_number
	if num > 1:
		for i in range(0, num):
			var ransnd = _get_ransnd()
			_iplay(ransnd)
	else:
		var ransnd = _get_ransnd()
		_iplay(ransnd)
