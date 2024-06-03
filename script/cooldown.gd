class_name Cooldown

var start: float
var duration: float

func _init(d: float):
    start = Time.get_ticks_msec()
    duration = d

func time() -> float:
    return (Time.get_ticks_msec() - start) / 1000

func done() -> bool:
    return time() >= duration
