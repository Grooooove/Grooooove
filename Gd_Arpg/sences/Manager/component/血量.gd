extends Node
class_name 血量组件

signal 死亡信号
signal 血量百分比信号

@export var 最大生命值 : float = 10
#@export var 关卡计时器 : Node

var 当前生命值 : float
var 当前游戏难度 = 0


func _ready() -> void:
	#关卡计时器.游戏难度提升信号.connect(游戏难度提升)
	当前生命值 = 最大生命值 + 当前游戏难度


func 伤害(受到伤害:float):
	当前生命值 = max(当前生命值 - 受到伤害,0)
	生命值变化()
	Callable(死亡).call_deferred()


func 血量百分比():
	#if 当前生命值 <= 0 :
		#return
	#
	return 当前生命值 / 最大生命值


func 生命值变化():
	血量百分比信号.emit()


func 死亡():
	if 当前生命值 == 0:
		死亡信号.emit()
		owner.queue_free()


#func 游戏难度提升(游戏难度:int):
	#当前游戏难度 = 游戏难度

