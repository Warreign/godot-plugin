extends Node

var scene_mapping: Dictionary

func _ready() -> void:
	print_verbose("[SceneSwitcher] Singleton initialized")


func load_scene_specification(scenes: SceneSpecification):
	scene_mapping = scenes.scene_specification_entries
