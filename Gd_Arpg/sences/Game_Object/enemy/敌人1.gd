extends CharacterBody2D

@onready var 移动组件 : Node = $"移动组件"
@onready var 精灵父节点: Node2D = $"精灵父节点"

func _process(delta):
	移动组件.向目标移动()
	移动组件.移动(self)

	var 移动朝向 = sign(velocity.x)
	if 移动朝向 != 0 :
		精灵父节点.scale = Vector2(-移动朝向,1)


