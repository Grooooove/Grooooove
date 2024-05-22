extends PanelContainer

signal 技能被选择
@onready var 标签名称 = $"VBoxContainer/名称标签"
@onready var 描述信息 = $"VBoxContainer/描述标签"

func _ready() -> void:
	gui_input.connect(被选择时)


func 技能升级卡设置(技能:技能升级):
	标签名称.text = 技能.名称
	描述信息.text = 技能.描述


func 被选择时(事件:InputEvent):
	if 事件.is_action("左键点击") :
		技能被选择.emit()	
