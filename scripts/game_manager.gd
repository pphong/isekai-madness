extends Node
@onready var topbar: Control = %Topbar

var score = 0
var coin = 0

func _ready() -> void:
	GameState.score_changed.connect(update_score)
	update_score(GameState.get_score())
	GameState.coin_changed.connect(update_coin)
	update_coin(GameState.get_coin())
	GameState.dropped_changed.connect(update_dropped)
	update_dropped(GameState.get_dropped())

func add_coin(coin_id):
	GameState.collect_coin(coin_id)
	print('+1 ting')
	print(GameState.get_coin())
	
func add_score():
	GameState.on_checkpoint()
	print('ting ting')

func update_coin(value: int) -> void:
	var coinLabel = topbar.get_node("Stackcoin")
	coinLabel.text = 'Coin in bag: %d' % value
	print(value)
	
func update_score(value: int) -> void:
	var scoreLabel = topbar.get_node("Score")
	scoreLabel.text = 'Score: %d' % value
	print(value)
	
func update_dropped(value: int) -> void:
	var dropLabel = topbar.get_node("Droppedcoin")
	dropLabel.text = 'Dropped coins: %d' % value
	print(value)
