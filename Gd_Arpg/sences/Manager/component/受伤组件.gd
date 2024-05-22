extends Area2D
class_name 受伤组件

@export var 血量 : Node

var 伤害文字预制体 = preload("res://UI/伤害文字.tscn")

func _ready() -> void:
	area_entered.connect(进入区域)
	
	
func 进入区域(区域:Area2D):
	if not 区域 is 伤害组件:
		return
		
	if 血量 == null:
		return
		
	var 伤害区域 = 区域 as 伤害组件
	血量.伤害(伤害区域.伤害数值)

	var 伤害文字实例化 = 伤害文字预制体.instantiate() as Node2D
	get_tree().get_first_node_in_group("前景层").add_child(伤害文字实例化)
	伤害文字实例化.global_position = global_position + (Vector2.UP * 18)

	伤害文字实例化.文字动画(str(伤害区域.伤害数值))
