extends Node

@export var 掉落物 : PackedScene
@export_range(0,1) var 掉率 : float = 0.3
@export var 血量 : Node
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	(血量 as 血量组件).死亡信号.connect(掉落物品)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func 掉落物品():
	if randf_range(0,1) > 掉率:
		return
		
	if 掉落物 == null:
		return
	
	if not owner is Node2D:
		return
	
	var 生成位置 = (owner as Node2D).global_position
	var 生成掉落物 = 掉落物.instantiate() as Node2D
	owner.get_parent().add_child(生成掉落物)
	生成掉落物.global_position = 生成位置
