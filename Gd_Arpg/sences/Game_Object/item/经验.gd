extends Node2D

@onready var 经验拾取 = $Area2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	经验拾取.area_entered.connect(拾取)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func 拾取(范围:Area2D):
	GameEvent.发出信号_增加经验(1)
	queue_free()
