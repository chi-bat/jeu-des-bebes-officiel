extends Node

var noms_de_bebes = []
var rng = RandomNumberGenerator.new()
var lang = "fr"

func _ready():
	var file_fr = FileAccess.open("res://liste_bebe_fr.txt", FileAccess.READ)
	while !file_fr.eof_reached():
		noms_de_bebes.append(file_fr.get_line())
	file_fr.close()

func change_lang(lang_c):
	noms_de_bebes = []
	if lang_c == "fr":
		var file_fr = FileAccess.open("res://liste_bebe_fr.txt", FileAccess.READ)
		while !file_fr.eof_reached():
			noms_de_bebes.append(file_fr.get_line())
		file_fr.close()
	elif lang_c == "en":
		var file_en = FileAccess.open("res://liste_bebe_en.txt", FileAccess.READ)
		while !file_en.eof_reached():
			noms_de_bebes.append(file_en.get_line())
		file_en.close()
	lang = lang_c

func generation_rarity():
	rng.randomize()
	var score = rng.randi_range(0, 100)
	if score <= 40:
		return (1)
	elif score <= 65:
		return (2)
	elif score <= 85:
		return (3)
	elif score <= 95:
		return (4)
	else:
		return (5)

func get_random_adj():
	rng.randomize()
	return noms_de_bebes[rng.randi_range(0, noms_de_bebes.size() - 1)]

func get_random_name(rarity):
	var name_ret = ""
	if rarity == 1:
		if rng.randi_range(0, 5) == 0:
			name_ret += "Normal"
		else:
			name_ret += get_random_adj()
	if rarity == 2:
		name_ret += get_random_adj()
	if rarity == 3:
		if rng.randi_range(0,1):
			name_ret += get_random_adj()
		else:
			name_ret += get_random_adj() + " " + get_random_adj()
	elif rarity == 4:
		if rng.randi_range(0,1):
			name_ret += get_random_adj() + " " + get_random_adj()
		else:
			name_ret += get_random_adj() + " " + get_random_adj() + " " + get_random_adj()
	elif rarity == 5:
		name_ret += get_random_adj() + " " + get_random_adj() + " " + get_random_adj()
		
	if lang == "fr":
		name_ret = "Bebe " + name_ret
	elif lang == "en":
		name_ret += " Baby"
	return (name_ret)

func generate_bebe():
	var ret = Bebe.new()
	ret.rarity = generation_rarity()
	ret.rarity_color = ret.rarity_color_list[ret.rarity - 1]
	ret.bebe_name = get_random_name(ret.rarity)
	return (ret)
