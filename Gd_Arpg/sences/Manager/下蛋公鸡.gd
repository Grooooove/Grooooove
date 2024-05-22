extends Node

const 生成半径 = 200

#@export var 小怪预制体: PackedScene
#@export var 小怪预制体2 : PackedScene
@export var 小怪数组 : Array[PackedScene]
@export var 关卡计时器 : Node
@onready var 计时器 = $Timer

var 当前游戏难度 = 0
var 生成位置  = Vector2.ZERO

func _ready() -> void:
	计时器.timeout.connect(公鸡下蛋)
	关卡计时器.游戏难度提升信号.connect(游戏难度提升)


func 敌人位置():
	var 玩家 = get_tree().get_first_node_in_group("玩家") as Node2D
	if 玩家 == null :
		return Vector2.ZERO
	
	var 随机角度 = Vector2.RIGHT.rotated(randf_range(0,TAU))
	生成位置 = 玩家.global_position + (随机角度 * 生成半径)
	
	for i in 4 :
		var 射线参数 = PhysicsRayQueryParameters2D.create(玩家.global_position,生成位置,1)
		var 射线检测 = get_tree().root.world_2d.direct_space_state.intersect_ray(射线参数)
		if 射线检测.is_empty() :
			break
		else :
			随机角度 = 随机角度.rotated(deg_to_rad(90))
			生成位置 = 玩家.global_position + (随机角度 * 生成半径)
		



func 公鸡下蛋():
	var 玩家 = get_tree().get_first_node_in_group("玩家") as Node2D
	if 玩家 == null :
		return
	
	for i in (当前游戏难度 +10) :
		敌人位置()
		#var 敌人 = 小怪预制体.instantiate() as Node2D
		var 敌人 = 小怪数组.pick_random().instantiate() as Node2D
		get_parent().add_child(敌人)
		敌人.global_position = 生成位置

func 游戏难度提升(游戏难度:int):
	当前游戏难度 = 游戏难度
	

