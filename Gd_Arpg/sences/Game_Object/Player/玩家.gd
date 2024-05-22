extends CharacterBody2D

var 移动速度 : float = 110
const 加速度 = 5
var 碰撞数量 = 0
@onready var 受伤计时器 = $"受伤间隔计时器"
@onready var 移动动画 = $AnimationPlayer
@onready var 生命值组件 = $"血量"
@onready var 血量显示UI = $"血量显示UI"
@onready var 技能组 = $"技能组"

func _ready():
	$"碰撞范围".body_entered.connect(有碰撞体进入)
	$"碰撞范围".body_exited.connect(有碰撞体出去)
	受伤计时器.timeout.connect(接收到计时器信号)
	血量显示UI.value = 生命值组件.血量百分比()
	生命值组件.血量百分比信号.connect(血量变化时)
	GameEvent.技能升级信号.connect(收到技能升级信号)


func _process(delta):
	velocity = Input.get_vector("左","右","上","下").normalized() * 移动速度
	#velocity = velocity.lerp(目标位置,(1- exp(-delta * 加速度)))
	move_and_slide()
	移动动画播放()


func 移动动画播放():
	if velocity.length() == 0:
		移动动画.stop()
	else :
		if velocity.y < 0 : 移动动画.play("移动_上")
		elif velocity.y > 0 : 移动动画.play("移动_下")
		elif velocity.x < 0 : 移动动画.play("移动_左")
		elif velocity.x > 0 : 移动动画.play("移动_右")


func 与敌人发生碰撞():
	if 碰撞数量 == 0 || !受伤计时器.is_stopped():
		return
	生命值组件.伤害(2)
	受伤计时器.start()
	

func 有碰撞体进入(敌人碰撞体:Node2D):
	碰撞数量 += 1
	与敌人发生碰撞()

func 有碰撞体出去(敌人碰撞体:Node2D):
	碰撞数量 -= 1
	
	
func 接收到计时器信号():
	与敌人发生碰撞()


func 血量百分比同步UI():
	血量显示UI.value = 生命值组件.血量百分比()
	

func 血量变化时():
	血量百分比同步UI()


func 收到技能升级信号(升级的技能:技能升级,当前升级次数:Dictionary):
	if not 升级的技能 is 技能类 :
		return
	var 技能_ = 升级的技能 as 技能类
	技能组.add_child(技能_.升级控制器.instantiate())
