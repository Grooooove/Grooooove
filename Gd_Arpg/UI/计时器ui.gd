extends CanvasLayer

@export var 计时器UI管理器 : Node
@onready var 标签 = $MarginContainer/Label

func _process(delta: float) -> void:
	if 计时器UI管理器 == null:
		return
	var 已过时间 = 计时器UI管理器.倒计时()
	标签.text = 更改时间格式(已过时间)


func 更改时间格式(秒:float):
	var 分钟 = floor(秒/60)
	var 秒钟 = 秒 - (分钟 * 60)
	return "%02d" %分钟 + ":" + ("%02d" %floor(秒钟))
