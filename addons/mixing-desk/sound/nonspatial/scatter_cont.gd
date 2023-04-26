extends BaseContainer
class_name ScatterCont

var timeroot
var scattering : bool = false
@export var voices : int = 5
@export var min_time : float = 1
@export var max_time : float = 5
@export var timeout : float = 7
@export var randomise : bool = true

func play():
	if scattering:
		return
	scattering = true
	var timeroot = Node.new()
	timeroot.name = 'timeroot'
	add_child(timeroot)
	for i in voices:
		var timer = Timer.new()
		timer.name = str('scat_timer_' + str(i))
		timeroot.add_child(timer)
		timer.start(randf_range(min_time,max_time))
		timer.timeout.connect(_scatter_timeout.bind(timer, min_time, max_time))
	if randf_range(0,1) > 0.7:
		_scatter()
	if timeout != 0:
		var timeouttimer = Timer.new()
		timeouttimer.wait_time= timeout
		add_child(timeouttimer)
		timeouttimer.start()
		timeouttimer.timeout.connect(stop)

func _scatter_timeout(timer, min_time, max_time):
	_scatter()
	timer.start(randf_range(min_time, max_time))

func stop():
	scattering = false
	if has_node("timeroot"):
		$timeroot.queue_free()

func _scatter():
	var ransnd = _get_ransnd()
	_iplay(ransnd)

func _get_ransnd(ran=randomise):
	var chance = randi() % soundlist.size()
	var ransnd = soundlist[chance]
	if ran:
		_randomise_pitch_and_vol(ransnd)
	return ransnd

func _range(item : float) -> float:
	return randf_range(-item,item)
