extends Node

@export var 血量 : Node
@export var 图片 : Sprite2D
@export var 闪光材质 : ShaderMaterial
var 闪光动画器 : Tween

func _ready() -> void:
	血量.血量百分比信号.connect(接收血量变化信号)
	图片.material = 闪光材质

func 接收血量变化信号():
	if 闪光动画器 != null && 闪光动画器.is_valid() :
		闪光动画器.kill()
		
	(图片.material as ShaderMaterial).set_shader_parameter("lerp_percent",1.0)
	闪光动画器 = create_tween()
	闪光动画器.tween_property(图片.material,"shader_parameter/lerp_percent",0.0,0.4)\
	.set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_CUBIC)
		
