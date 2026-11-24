extends Node

var score = 0
var coin = 0
var dropped = 0
signal score_changed(total:int)
signal coin_changed(total:int)
signal dropped_changed(amount:int)

var coin_collection: Dictionary = {}
	
func get_score() -> int:
	return score
	
func get_coin() -> int:
	return coin	
	
func get_dropped() -> int:
	return dropped		
	
func collect_coin(coin_id, value:int = 1) -> bool:
	print('coin_id %s' % coin_id)
	#collected
	if coin_collection.has(coin_id):
		return false
	#collecting
	coin_collection[coin_id] = true
	coin += value
	
	coin_changed.emit(get_coin())
	return true
	
func on_checkpoint() -> void:
	score += coin
	coin = 0
	score_changed.emit(get_score())
	coin_changed.emit(get_coin())

func on_death() -> void:
	dropped += coin
	coin = 0
	
	score_changed.emit(get_score())
	dropped_changed.emit(dropped)
	
func begin() -> void:
	coin = 0
	
	score_changed.emit(get_score())
	dropped_changed.emit(dropped)
