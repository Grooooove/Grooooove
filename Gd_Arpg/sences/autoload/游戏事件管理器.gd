extends Node

signal 增加经验信号(经验值:float)
signal 技能升级信号(技能:技能升级,当前可选技能:Dictionary)

func 发出信号_增加经验(经验值:float):
	增加经验信号.emit(经验值)


func 发出技能升级信号(技能:技能升级,当前可选技能:Dictionary):
	技能升级信号.emit(技能,当前可选技能)
