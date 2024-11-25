extends Node
@onready var texture_progress_bar: TextureProgressBar = $"../Camera2D/TextureProgressBar"

var max_spirit = 100
var current_spirit = max_spirit
var rate = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture_progress_bar.value = 10000
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	texture_progress_bar.value -= rate
	
	#current_spirit = max(0,current_spirit)
	#update_spirit()
	
	pass
	
#
#func update_spirit():
	#var texture_rect = $Fill_spirit
	#var rect_scale = texture_rect.rect_scale.x
	#var fill_width_percent = current_spirit / max_spirit
	#texture_rect.rect_scale.x = fill_width_percent * rect_scale
	
	
