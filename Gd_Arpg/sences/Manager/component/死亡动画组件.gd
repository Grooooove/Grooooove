extends Node2D

@export var 血量 : Node
@export var 图片 : Sprite2D

func _ready() -> void:
	血量.死亡信号.connect(接收到死亡信号)
	$GPUParticles2D.texture =图片.texture  #没明白这行有什么用,注释到这行也可以正常运行

func 接收到死亡信号():
	if owner == null || not owner is Node2D :
		return
		
	var 死哪 = owner.global_position
	
	var 敌人 = get_tree().get_first_node_in_group("敌人")
	get_parent().remove_child(self)
	敌人.add_child(self)
	global_position = 死哪
	$AnimationPlayer.play("死亡动画")
