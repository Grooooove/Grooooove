extends Node2D

@onready var 伤害 = $"伤害组件"

var 最大距离 = 100
var 基础旋转 = Vector2.RIGHT

func _ready() -> void:
	基础旋转 = Vector2.RIGHT.rotated(randf_range(0,TAU))
	var 动画 = create_tween()
	动画.tween_method(动画控制 , 0.0 , 2.0 , 3)
	#在3秒内,持续调用"动画控制"函数,传参"旋转"的值由0.0逐渐增加到2.0
	动画.tween_callback(queue_free)


func 动画控制(旋转 :float):
	var temp = 旋转 #/ 2
	var 旋转角度 = temp * 最大距离
	var 当前方向 = 基础旋转.rotated(旋转 * TAU)
	
	var 玩家 = get_tree().get_first_node_in_group("玩家") as Node2D
	if 玩家 == null :
		return
	else :
		global_position = 玩家.global_position + (当前方向 * 旋转角度)
