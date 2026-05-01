@tool
extends EditorPlugin

const PLUGIN_CONTROL: PackedScene = preload("res://addons/test-plugin/plugin_control.tscn")
const PLUGIN_NAME: String = "Test Plugin"
var PLUGIN_ICON: Texture2D = EditorInterface.get_editor_theme().get_icon("Node", "EditorItems")

var plugin_control_instance: Control

func _enable_plugin() -> void:
	# Add autoloads here.
	pass


func _disable_plugin() -> void:
	# Remove autoloads here.
	pass


func _enter_tree() -> void:
	# Initialization of the plugin goes here.
	plugin_control_instance = PLUGIN_CONTROL.instantiate()
	EditorInterface.get_editor_main_screen().add_child(plugin_control_instance)
	plugin_control_instance.hide()
	pass

func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	if plugin_control_instance:
		plugin_control_instance.queue_free()
	pass
	
func _has_main_screen() -> bool:
	return true
	
func _get_plugin_name() -> String:
	return PLUGIN_NAME
	
func _get_plugin_icon() -> Texture2D:
	return PLUGIN_ICON
	
func _make_visible(visible: bool) -> void:
	plugin_control_instance.visible = visible
	
