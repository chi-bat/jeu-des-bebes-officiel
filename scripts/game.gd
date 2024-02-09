extends Node2D

func _on_button_pressed():
	var test_bebe = Generateur.generate_bebe()
	var texte_bebe = ""
	var texte_rarity = ""
	if test_bebe.rarity > 4:
		texte_bebe = "[wave amp=50.0 freq=5.0 connected=1]"
		texte_rarity = "[wave amp=50.0 freq=5.0 connected=1]"
	texte_bebe +="[center][color=" + test_bebe.rarity_color + "]%s[/color][/center]" % test_bebe.bebe_name
	texte_rarity += "[center][color=" + test_bebe.rarity_color + "]Prestige : "
	for i in range(test_bebe.rarity):
		texte_rarity += "★"
	texte_rarity += "[/color][/center]"
	if test_bebe.rarity > 4:
		texte_bebe += "[/wave]"
		texte_rarity += "[/wave]"
	$GeneratedText.text = texte_bebe
	$RarityText.text = texte_rarity


func _on_lang_button_toggled(toggled_on):
	if (toggled_on == true):
		Generateur.change_lang("en")
	else:
		Generateur.change_lang("fr")
