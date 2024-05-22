extends Node

signal 游戏难度提升信号(游戏难度:int)

const 难度进阶时间 = 5

@onready var 计时 =$Timer
@export var 结算画面 : PackedScene

var 游戏难度 = 0 

func _ready() -> void:
	计时.timeout.connect(计时结束)


func _process(delta: float) -> void:
	var 难度阶梯 = 计时.wait_time - ((游戏难度 + 1) * 难度进阶时间)
	if 计时.time_left <= 难度阶梯 :
		游戏难度 += 1
		游戏难度提升信号.emit(游戏难度)
	
	
func 倒计时():
	return 计时.wait_time - 计时.time_left


func 计时结束():
	var 结算界面实例化 = 结算画面.instantiate()
	add_child(结算界面实例化)



