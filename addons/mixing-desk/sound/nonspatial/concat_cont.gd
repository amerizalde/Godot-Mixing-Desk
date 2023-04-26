extends BaseContainer
class_name ConcatCont

func play(num=0):
	if num == 0:
		num = sound_number
	randomize()
	for i in range(0, num):
		var ransnd = _get_ransnd()
		ransnd.play()
		await(ransnd).finished
