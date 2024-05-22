extends Node

@export var 剑 : PackedScene
const 攻击范围  = 150
var 伤害 : int = 5
var 基础冷却时间
var 技能等级 : int = 1 


func _ready() -> void:
	GameEvent.技能升级信号.connect(接收技能升级信号)
	基础冷却时间 = $Timer.wait_time

func 使用剑():
	var 玩家 = get_tree().get_first_node_in_group("玩家") as Node2D
	if 玩家 == null:
		return
		
	var 敌人 = get_tree().get_nodes_in_group("敌人")
	敌人 = 敌人.filter(func (小怪:Node2D) : return 小怪.global_position.distance_squared_to(玩家.global_position) < pow(攻击范围,2))
	if 敌人.size() == 0:
		return
	敌人.sort_custom(func(a:Node2D,b:Node2D): 
		var 小怪A = a.global_position.distance_squared_to(玩家.global_position)
		var 小怪B = b.global_position.distance_squared_to(玩家.global_position)
		return 小怪A < 小怪B
		)
	
	var 实例化剑 = 剑.instantiate() as 剑预制体
	玩家.get_parent().add_child(实例化剑)
	实例化剑.伤害.伤害数值 = 伤害
	
	实例化剑.global_position = 敌人[0].global_position
	实例化剑.global_position += Vector2.RIGHT.rotated(randf_range(0,TAU))
	
	var 旋转取值 = 敌人[0].global_position - 实例化剑.global_position
	实例化剑.rotation = 旋转取值.angle()
	实例化剑.scale = Vector2(1+(技能等级 * 0.1),1+(技能等级 * 0.1))
	
	
func 接收技能升级信号(技能:技能升级,当前选择技能:Dictionary) :
	if 技能.ID != "10001" :
		return
		
	#var 技能效果 = 当前选择技能["10001"]["描述"] * .1     #没明白什么意思
	var 技能效果 = 基础冷却时间 * .1
	$Timer.wait_time -= 技能效果
	技能等级 += 1 
	伤害 += 技能等级 * 10
	$Timer.start()
