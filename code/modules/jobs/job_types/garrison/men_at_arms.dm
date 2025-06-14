/datum/job/men_at_arms
	title = "Men-at-arms"
	tutorial = "Like a hound on a leash, you stand vigilant for your masters. \
	You live better than the rest of the taffers in this kingdom-- \
	infact, you take shifts manning the gate with your brethren, \
	keeping the savages out, keeping the shit-covered knaves away from your foppish superiors. \
	It will be a cold day in hell when you and your compatriots are slain, and nobody in this town will care. \
	The nobility needs good men, and they only come in a pair of pairs."
	flag = WATCHMAN
	department_flag = GARRISON
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_MENATARMS
	faction = FACTION_STATION
	total_positions = 4
	spawn_positions = 4
	min_pq = 6
	bypass_lastclass = TRUE

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_PLAYER_NONDISCRIMINATED

	outfit = /datum/outfit/job/watchman
	advclass_cat_rolls = list(CTAG_MENATARMS = 20)
	cmode_music = 'sound/music/cmode/garrison/CombatManAtArms.ogg'
	give_bank_account = 15
	min_pq = 6

/datum/outfit/job/watchman
	job_bitflag = BITFLAG_GARRISON

/datum/outfit/job/watchman/pre_equip(mob/living/carbon/human/H)
	. = ..()
	cloak = /obj/item/clothing/cloak/stabard/guard
	head = /obj/item/clothing/head/helmet/kettle/slit // does not cover the face, so it is fine for guards to have
	shirt =	/obj/item/clothing/armor/chainmail
	pants = /obj/item/clothing/pants/trou/leather/guard
	shoes = /obj/item/clothing/shoes/boots
	belt = /obj/item/storage/belt/leather
	neck = /obj/item/clothing/neck/gorget
	armor = /obj/item/clothing/armor/medium/scale // this is balanced, don't freek out, it protects LESS than a steel cuirass, but protects the legs
	gloves = /obj/item/clothing/gloves/chain
	beltl = /obj/item/weapon/sword/arming
	backl = /obj/item/storage/backpack/satchel
	backpack_contents =	list(/obj/item/storage/keyring/manorguard) // this is done so that the marksmen can have their quiver on their hip
/datum/outfit/job/watchman/post_equip(mob/living/carbon/human/H)
	. = ..()
	if(H.cloak)
		if(!findtext(H.cloak.name,"([H.real_name])"))
			H.cloak.name = "[H.cloak.name]"+" "+"([H.real_name])"

/datum/job/men_at_arms/after_spawn(mob/living/carbon/spawned, client/player_client)
	..()

/datum/advclass/menatarms/watchman_pikeman
	name = "Men-At-Arms Pikeman"
	tutorial = "You once warded the town, beating the poor and killing the senseless. \
	Now you get to stare at them in the eyes, watching as they writhe, \
	skulls CRACKED personally by one of the Monarch's brutes. \
	You are poor, and your belly is yet full."
	outfit = /datum/outfit/job/watchman/pikeman

	category_tags = list(CTAG_MENATARMS)

/datum/outfit/job/watchman/pikeman/pre_equip(mob/living/carbon/human/H)
	..()
	backr = /obj/item/weapon/polearm/spear/billhook // do not give them a polehammer, elves are not strong enough to wield it
	backpack_contents = list(/obj/item/weapon/knife/dagger/steel/special)
	H.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	H.change_stat(STATKEY_STR, 2)
	H.change_stat(STATKEY_END, 1)
	H.change_stat(STATKEY_CON, 1)
	H.change_stat(STATKEY_SPD, -1)
	H.verbs |= /mob/proc/haltyell
	ADD_TRAIT(H, TRAIT_KNOWBANDITS, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

/datum/advclass/menatarms/watchman_swordsmen
	name = "Men-At-Arms Footman"
	tutorial = "You once warded the town, your shield acting as a second wall, just in case the REAL walls were breached. \
	You were best with a shield in one hand, blade in the other. Nowadays, you love watching the living devolve to empty bloodbags on the ground, \
	exanguinated personally by one of the Monarch's best. \
	You are poor, and your belly is yet full."
	outfit = /datum/outfit/job/watchman/swordsmen
	category_tags = list(CTAG_MENATARMS)

/datum/outfit/job/watchman/swordsmen/pre_equip(mob/living/carbon/human/H)
	..()
	backr =	/obj/item/weapon/shield/tower // no idea if this has heraldry or not, if so, cool
	backpack_contents = list(/obj/item/weapon/knife/dagger/steel/special)
	if(H.mind)
		H.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
		H.adjust_skillrank(/datum/skill/combat/shields, 4, TRUE)
		H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
		H.change_stat(STATKEY_STR, 2) // guaranteed 10 minimum strength for elves, because sub 9 STR on a melee fighter is illogical
		H.change_stat(STATKEY_END, 1)
		H.change_stat(STATKEY_CON, 1)
		H.change_stat(STATKEY_SPD, -1) // all of the men-at-arms get this, because they are meant to stay in the keep, not run around like idiots
		ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_KNOWBANDITS, TRAIT_GENERIC)
		H.verbs |= /mob/proc/haltyell

/datum/advclass/menatarms/watchman_ranger
	name = "Men-At-Arms Crossbowman"
	tutorial = "You once warded the town, aiming for legs or head depending on the crime. \
	With your precision, it's only natural you were awarded with a crossbow. \
	While you may stay in the back, you're no coward, nor some fancy-foot ranger, and you may take up the blade if you need. \
	You love hearing the crack of some itinerant knight's plate armor as your bolt pierces right through it, just a moment after they let slip an insult to your master. \
	You are poor, and your belly is yet full."
	outfit = /datum/outfit/job/watchman/ranger

	category_tags = list(CTAG_MENATARMS)

/datum/outfit/job/watchman/ranger/pre_equip(mob/living/carbon/human/H)
	..()
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow // this is a crossbowman, they should have a crossbow, genius, I know
	beltr = /obj/item/ammo_holder/quiver/bolts
	backpack_contents = list(/obj/item/weapon/knife/dagger/steel/special)
	if(H.mind)
		H.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/bows, 4, TRUE)
		H.adjust_skillrank(/datum/skill/combat/crossbows, 4, TRUE)
		H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE) // for backup, this is fine for them to have, 3 swords skill is almost definitely lower than any of their opponents primary skills
		H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
		H.change_stat(STATKEY_STR, 1) // for cranking the crossbow, they need some strength, but not as much as a swordsman or pikeman
		H.change_stat(STATKEY_PER, 2)
		H.change_stat(STATKEY_SPD, -1)
		H.verbs |= /mob/proc/haltyell
		ADD_TRAIT(H, TRAIT_KNOWBANDITS, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC) // this is a crown guard, not a ranger, so they should have medium armor, not light armor
