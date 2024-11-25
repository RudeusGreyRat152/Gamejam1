extends Node

var max_spirit = 100
var current_spirit = max_spirit
var rate = 0.1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Fill_spirit = get_node("Fill_spirit") as TextureRect
	update_spirit()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	current_spirit -= rate * delta
	current_spirit = max(0,current_spirit)
	pass

func update_spirit():
	var fill_width_percent = current_spirit / max_spirit
	$Fill_spirit.rect_size.x = rect_size.x * fill_width_percent
	
	
