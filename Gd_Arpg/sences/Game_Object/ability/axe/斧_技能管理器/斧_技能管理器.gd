extends Node

@export var 斧子预制体 : PackedScene

var 伤害 = 10
func 发射斧子():
	var 玩家 = get_tree().get_first_node_in_group("玩家") as Node2D
	if 玩家 == null :
		return
	var 斧技能实例化 = 斧子预制体.instantiate() as Node2D
	get_parent().add_child(斧技能实例化)
	斧技能实例化.global_position = 玩家.global_position
	斧技能实例化.伤害.伤害数值  = 伤害
