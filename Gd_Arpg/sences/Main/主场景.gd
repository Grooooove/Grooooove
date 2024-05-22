extends Node
@export var 结算 : PackedScene

func _ready() -> void:
	%"玩家".生命值组件.死亡信号.connect(结算画面)


func 结算画面():
	var 结算画面实例化 = 结算.instantiate()
	add_child(结算画面实例化)
	结算画面实例化.游戏失败界面()
	
