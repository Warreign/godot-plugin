@tool

@icon("res://addons/listview/icons/BoxContainer.svg")

class_name ListView
extends ScrollContainer

signal entry_generated(widget: ListViewEntry)
signal item_clicked(item: ListViewEntry)
signal item_hover_changed(item: ListViewEntry, is_hovered: bool)
signal item_selection_changed(selected_item: Object)

#@export_category("")
@export
var entry_scene: PackedScene:
	set = set_entry_scene

@export
var is_vertical: bool = false:
	set(value):
		is_vertical = value
		_update_items()

@export_range(0, 10, 1, "prefer_slider", "or_greater")
var debug_items_count: int = 5:
	set(value):
		debug_items_count = value
		_update_items()

@export_range(0, 256, 1.0, "prefer_slider", "suffix:px", "or_greater", "or_less")
var separation: int = 0:
	set(value):
		separation = value
		_update_items()


@export_tool_button("Update")
var _update_items_action = _update_items


#--- 

var _items: Array[Object] = []
var _entry_instances: Array[ListViewEntry] = []
var _container: BoxContainer = null
var _placeholder_entry_scene: PackedScene = preload("res://addons/listview/placeholder_entry.tscn")

#---

func _enter_tree() -> void:
	_update_items()


func _exit_tree() -> void:
	pass	


func _ready() -> void:
	pass


func _reconstruct_hierarchy() -> void:
	# Clean current object tree
	if _container:
		_container.queue_free()
		_container = null
	
	
	# Create and fill box container with items
	_container = BoxContainer.new()
	_container.set_vertical(is_vertical)
	_container.add_theme_constant_override("separation", separation)
	_container.set_mouse_filter(Control.MOUSE_FILTER_PASS)
	for item in _entry_instances:
		_container.add_child(item, false, Node.INTERNAL_MODE_FRONT)
	add_child(_container, false, INTERNAL_MODE_FRONT)

	set_anchors_preset(Control.PRESET_CENTER_LEFT)


func _update_items() -> void:
	if Engine.is_editor_hint():
		print_verbose("Update ListView")
		_entry_instances.clear()
		for idx in range(0, debug_items_count):
			var entry_instance: ListViewEntry = get_entry_scene().instantiate()
			_entry_instances.append(entry_instance)
		_reconstruct_hierarchy()


func get_entry_scene() -> PackedScene:
	if entry_scene:
		return entry_scene
	else:
		return _placeholder_entry_scene


func set_entry_scene(scene: PackedScene) -> void:
	if scene:
		var scene_instance = scene.instantiate()
		if scene_instance is ListViewEntry:
			entry_scene = scene
			_update_items()
		else:
			printerr("Item class should inherit from ListViewEntry")
		scene_instance.free()
	else:
		entry_scene = null
		_update_items()


func set_items(items: Array[Object]) -> void:
	# Cleanup
	_entry_instances.clear()
	for item_data in _items:
		item_data.free()
	_items.clear()
	
	# Generating new items
	_items = items
	for item_data in _items:
		var entry_instance: ListViewEntry = get_entry_scene().instantiate()
		assert(entry_instance)
		entry_instance.mouse_entered.connect(func (): item_hover_changed.emit(entry_instance, true))
		entry_instance.mouse_exited.connect(func(): item_hover_changed.emit(entry_instance, false))
		entry_instance.focus_entered.connect(func():  print("focused"))
		#entry_instance.focus_exited.connect(func():  item_hover_changed.emit(entry_instance, false))
		entry_instance._set_item_data(item_data)
		entry_instance.update_minimum_size()
		_entry_instances.append(entry_instance)
		entry_generated.emit(entry_instance)
	
	# Reconstruct hierarchy
	_reconstruct_hierarchy()
