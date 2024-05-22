extends Node

@export var 技能升级池 : Array[技能升级]
@export var 经验值管理器 : Node
@export var 技能升级界面 : PackedScene

var 当前升级组 = {}

func _ready() -> void:
	经验值管理器.升级信号.connect(升级时)
	

func 升级时(当前等级:int):
	var 技能升级界面实例化 = 技能升级界面.instantiate()
	add_child(技能升级界面实例化)
	var 技能数组 = 技能池里选二个技能()
	技能升级界面实例化.技能升级组设置(技能数组 as Array[技能升级])
	技能升级界面实例化.选择技能.connect(技能被选择时)


func 技能池里选二个技能():
	var 已选技能组  : Array[技能升级] = []
	var 筛选技能 = 技能升级池.duplicate()
	for i in 2 :
		if 筛选技能.size() == 0 :
			break
			
		var 选择升级技能 = 筛选技能.pick_random() as 技能升级
		已选技能组.append(选择升级技能)
		筛选技能 = 筛选技能.filter(func (技能): return 技能.ID != 选择升级技能.ID)
	return 已选技能组



func 选择升级技能(技能:技能升级):
	var 可以升级 = 当前升级组.has(技能.ID)
	if !可以升级 :
		当前升级组[技能.ID] = {
			"资源" : 选择升级技能,
			"已升级次数" : 1
			}
	else:
		当前升级组[技能.ID]["已升级次数"] += 1
	if 技能.等级上限 > 0 :
		var 当前技能等级 = 当前升级组[技能.ID]["已升级次数"]
		if 当前技能等级 == 技能.等级上限 :
			技能升级池 = 技能升级池.filter(func (_技能) : return _技能.ID != 技能.ID)
			
	GameEvent.发出技能升级信号(技能,当前升级组)


func 技能被选择时(技能:技能升级):
	选择升级技能(技能)
