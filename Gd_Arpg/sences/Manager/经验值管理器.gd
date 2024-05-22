extends Node

signal 获取经验信号(当前经验 : float, 当前升级所需经验 : float)
signal 升级信号(下一等级:int)

const 每级经验差 = 5
var 当前经验 = 0
var 当前等级 = 1
var 当前升级所需经验 = 5


func _ready() -> void:
	GameEvent.增加经验信号.connect(接收信号_增加经验)


func 获取经验(经验值:float):
	当前经验 = min(当前经验 + 经验值,当前升级所需经验) 
	获取经验信号.emit(当前经验,当前升级所需经验)
	if 当前经验 == 当前升级所需经验 :
		当前等级 += 1
		当前升级所需经验 += 每级经验差
		当前经验 = 0
		获取经验信号.emit(当前经验,当前升级所需经验)
		升级信号.emit(当前等级)
	

func 接收信号_增加经验(经验值:float):
	获取经验(经验值)
