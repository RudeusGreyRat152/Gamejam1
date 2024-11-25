extends CharacterBody2D

@onready var player: CharacterBody2D = $"../../Player"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
		add_to_group("light")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.position = player.position + Vector2(-100,0)
