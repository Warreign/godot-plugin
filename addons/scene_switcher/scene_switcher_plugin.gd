@tool
extends EditorPlugin

const SINGLETON_PATH: String = "res://addons/scene_switcher/switcher/scene_switcher.gd"
const SINGLETON_NAME: String = "SceneSwitcher"

const INSPECTOR_PLUGIN_PATH: String = "res://addons/scene_switcher/inspector/scene_switcher_inspector_plugin.gd"

var inspector_plugin_instance: SceneSwitcherInspectorPlugin

func _enable_plugin() -> void:
	add_autoload_singleton(SINGLETON_NAME, SINGLETON_PATH)
	

func _disable_plugin() -> void:
	remove_autoload_singleton(SINGLETON_NAME)


func _enter_tree() -> void:
	inspector_plugin_instance = preload(INSPECTOR_PLUGIN_PATH).new()
	add_inspector_plugin(inspector_plugin_instance)

func _exit_tree() -> void:
	remove_inspector_plugin(inspector_plugin_instance)
	
func _input(event: InputEvent) -> void:
	#if (event.is_action("test_action")):
		#print("Triggered test action")
	pass
