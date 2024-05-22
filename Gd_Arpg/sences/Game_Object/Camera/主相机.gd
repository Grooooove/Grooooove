extends Camera2D


var 目标位置 = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	make_current()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	跟随移动()
	global_position = global_position.lerp(目标位置,1.0 - exp(-delta * 20))


func 跟随移动():
	var 玩家 = get_tree().get_first_node_in_group("玩家") as Node2D
	if 玩家 == null:
		return
	
	目标位置 = 玩家.global_position
	
