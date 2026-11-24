@tool
extends Area2D
@onready var game_manager: Node = %GameManager
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@export var coin_id: String

func _ready() -> void:
	coin_id = str(get_path()).sha1_text().substr(0, 10)
	print(coin_id)
	
	if GameState.coin_collection.has(coin_id):
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	game_manager.add_coin(coin_id)
	animation_player.play("pickup")
