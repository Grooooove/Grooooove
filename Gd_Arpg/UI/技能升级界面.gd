extends CanvasLayer

signal 选择技能(技能:技能升级)
@export var 技能升级卡界面 :PackedScene
@onready var 容器 : HBoxContainer = $"MarginContainer/升级卡容器"

func _ready() -> void:
	get_tree().paused = true


func 技能升级组设置(技能组:Array[技能升级]):
	for 技能 in 技能组:
		var 技能卡实例化 = 技能升级卡界面.instantiate()
		容器.add_child(技能卡实例化)
		技能卡实例化.技能升级卡设置(技能)
		技能卡实例化.技能被选择.connect(选择技能时.bind(技能))


func 选择技能时(技能:技能升级):
	选择技能.emit(技能)
	get_tree().paused = false
	queue_free()
