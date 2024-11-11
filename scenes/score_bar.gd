extends Control

signal update_scores

var begin_time = Time.get_ticks_msec()
var last_time_sec: int = 0
var time_sec: int
var time_min: int

func _ready() -> void:
	Globals.connect("update_scores", Callable(self, "update_score_label"))

func _physics_process(_delta: float) -> void:
	update_time()
	
func update_time():
	var current_time = Time.get_ticks_msec() - begin_time
	time_sec = int(current_time / 1000.0)
	time_min = int(time_sec / 60.0)
	time_sec -= time_min * 60
	if time_sec != last_time_sec:
		last_time_sec = time_sec
		update_time_label()
		
func update_score_label():
	get_node("ScoreContainer/Label").text = str(Globals.p1_score)
	get_node("ScoreContainer/Label2").text = str(Globals.p2_score)
		
func update_time_label():
	get_node("TimeContainer/TimeLabel").text = "%d:%d" % [time_min, time_sec]
