extends Node

@export var 移动速度 : float = 60
@export var 加速度 : float = 5

var 跑步 = Vector2.ZERO

func 向目标移动():
	var 父节点 = owner as Node2D
	if 父节点 == null :
		return
	
	var 玩家 = get_tree().get_first_node_in_group("玩家") as Node2D
	if 玩家 == null :
		return
	
	var 方向 = (玩家.global_position - 父节点.global_position).normalized()
	加速度移动(方向)


func 加速度移动(移动方向:Vector2):
	var 前进 = 移动方向 * 移动速度
	跑步 = 跑步.lerp(前进 , 1 - exp(-加速度 * get_process_delta_time()))
	

func 移动(敌人 : CharacterBody2D):
	敌人.velocity = 跑步
	敌人.move_and_slide()
	跑步 = 敌人.velocity
	
