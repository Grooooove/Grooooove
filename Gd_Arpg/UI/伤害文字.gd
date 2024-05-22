extends Node2D



func 文字动画(text : String):
	$Label.text = text
	var 动画器 = create_tween()
	动画器.set_parallel()
	
	动画器.tween_property(self,"global_position" , global_position +(Vector2.UP * 16), 0.6)\
	.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
	
	动画器.chain()
	
	动画器.tween_property(self,"global_position" , global_position +(Vector2.UP * 48), 0.8)\
	.set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_CUBIC)
	
	动画器.tween_callback(queue_free)
