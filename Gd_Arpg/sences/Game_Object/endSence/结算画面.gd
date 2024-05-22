extends CanvasLayer

@onready var 再次按钮 = %"再来一次按钮"
@onready var 退出按钮 = %"退出按钮"

func _ready() -> void:
	get_tree().paused = true
	#一样,涉及到暂停的命令时,都得考虑将运行模式改为始终
	self.process_mode =Node.PROCESS_MODE_ALWAYS
	再次按钮.pressed.connect(再来一次)
	退出按钮.pressed.connect(退出游戏)


func 再来一次():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://sences/Main/主场景.tscn")


func 退出游戏():
	get_tree().quit()


func 游戏失败界面():
	%"大标题".text = "死"
	%"小标题".text = "菜就多练"
