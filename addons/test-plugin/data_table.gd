extends Resource
class_name CustomDataTable

#@export_category("Custom Data")
#@export_flags("Fire", "Water", "Earth", "Wind") var spell_elements = 0
#
#@export_file var sound_effect_path: String
#@export_file("*.txt") var notes_path: String
#@export_file var level_paths: Array[String]
#
#@export_exp_easing var transition_speed
#@export_exp_easing("attenuation") var fading_attenuation
#@export_exp_easing("positive_only") var effect_power
#@export_exp_easing var speeds: Array[float]
#
#@export_dir var sprite_folder_path: String
#@export_dir var sprite_folder_paths: Array[String]
#
#@export_enum("Rebecca", "Mary", "Leah") var character_name: String = "Rebecca"
#
#enum CharacterName {REBECCA, MARY, LEAH}
#@export var character_name2: CharacterName
#
#enum CharacterItem {SWORD, SPEAR, MACE}
#@export var character_items: Array[CharacterItem]
#
#@export_color_no_alpha var dye_color: Color
#@export_color_no_alpha var dye_colors: Array[Color]
#
#enum Direction {LEFT, RIGHT, UP, DOWN}
#
## Built-in types.
#@export var string = ""
#@export var int_number = 5
#@export var float_number: float = 5
#
## Enums.
#@export var type: Variant.Type
#@export var format: Image.Format
#@export var direction: Direction
#
## Resources.
#@export var image: Image
##@export var custom_resource: CustomResource
#
## Nodes.
##@export var node: Node
##@export var custom_node: CustomNode
#
## Typed arrays.
#@export var int_array: Array[int]
#@export var direction_array: Array[Direction]
#@export var image_array: Array[Image]
##@export var node_array: Array[Node]
#
#@export_flags_2d_navigation var navigation_layers: int
#@export_flags_2d_navigation var navigation_layers_array: Array[int]
#
#@export_flags_3d_render var render_layers: int
#@export_flags_3d_render var render_layers_array: Array[int]
#
#@export_group("Racer Properties")
#@export var nickname = "Nick"
#@export var age = 26
#
#@export_group("Car Properties", "car_")
#@export var car_label = "Speedy"
#@export var car_number = 3
#
#@export_group("", "")
#@export var ungrouped_number = 3
#
#@export_multiline var character_biography: String
#@export_multiline var npc_dialogs: Array[String]
#
#@export_node_path("Button", "TouchScreenButton") var some_button
#@export_node_path("Button", "TouchScreenButton") var many_buttons: Array[NodePath]
#
#@export_placeholder("Name in lowercase") var character_id: String
#@export_placeholder("Name in lowercase") var friend_ids: Array[String]
#
#@export_range(0, 20) var number
#@export_range(-10, 20) var number2
#@export_range(-10, 20, 0.2) var number3: float
#@export_range(0, 20) var numbers: Array[float]
#
#@export_range(0, 100, 1, "or_greater") var power_percent
#@export_range(0, 100, 1, "or_greater", "or_less") var health_delta
#
#@export_range(-180, 180, 0.001, "radians_as_degrees") var angle_radians
#@export_range(0, 360, 1, "degrees") var angle_degrees
#@export_range(-8, 8, 2, "suffix:px") var target_offset
#
#@export_group("Racer Properties")
#@export var nickname1 = "Nick"
#@export var age1 = 26
#
#@export_subgroup("Car Properties", "car_")
#@export var car_label1 = "Speedy"
#@export var car_number1 = 3

@export var dict: Dictionary

class InnerResource:
	extends Resource
	
	@export var name: String
	@export var scene: PackedScene
	
@export var rs: InnerResource
@export var rsa: Array[InnerResource]

@export var asda: Dictionary
