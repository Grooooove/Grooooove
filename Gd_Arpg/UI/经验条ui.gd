extends CanvasLayer

@export var 经验值管理器 :Node
@onready var 经验条 = $MarginContainer/ProgressBar

func _ready() -> void:
	经验条.value = 0 
	经验值管理器.获取经验信号.connect(获取经验时)


func 获取经验时(当前经验 : float, 当前升级所需经验 : float):
	var 经验百分比 = 当前经验 / 当前升级所需经验
	经验条.value = 经验百分比



