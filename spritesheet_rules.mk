# $1: filename
# $2: width
# $3: height
define MAKE_SPRITECOMP_RULES_IMPL
$1: %.4bpp: %.png
	$(GFX) $$< $$@ -mwidth $2 -mheight $3

# check if sprite can be compressed
ifneq ($(filter $2.$3,2.2 2.4 4.4 8.8),)
$1.sz: $1
	$(SPRITECOMP) $$< $$@ -mwidth $2 -mheight $3
endif
endef

define MAKE_SPRITECOMP_RULES
$(eval $(call MAKE_SPRITECOMP_RULES_IMPL,$1,$2,$3))
endef

POKEMONGFXDIR := graphics/pokemon
OBJEVENTGFXDIR := graphics/object_events/pics
FLDEFFGFXDIR := graphics/field_effects/pics
MISCGFXDIR := graphics/misc

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/brendan/walking.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/brendan/running.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/brendan/field_move.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/brendan/surfing.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/brendan/mach_bike.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/brendan/acro_bike.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/brendan/fishing.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/brendan/watering.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/brendan/underwater.4bpp,4,4)
$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/brendan/decorating.4bpp,2,4)


$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/elite_four/drake.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/elite_four/glacia.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/elite_four/phoebe.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/elite_four/sidney.4bpp,2,4)


$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/frontier_brains/anabel.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/frontier_brains/brandon.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/frontier_brains/greta.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/frontier_brains/lucy.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/frontier_brains/noland.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/frontier_brains/spenser.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/frontier_brains/tucker.4bpp,2,4)


$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/gym_leaders/brawly.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/gym_leaders/flannery.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/gym_leaders/juan.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/gym_leaders/liza.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/gym_leaders/norman.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/gym_leaders/roxanne.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/gym_leaders/tate.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/gym_leaders/wattson.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/gym_leaders/winona.4bpp,2,4)


$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/may/walking.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/may/running.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/may/field_move.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/may/surfing.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/may/mach_bike.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/may/acro_bike.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/may/fishing.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/may/watering.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/may/underwater.4bpp,4,4)
$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/may/decorating.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/pokemon_old/regi.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/pokemon_old/rayquaza_still.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/dolls/unused_natu_doll.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/dolls/unused_magnemite_doll.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/dolls/unused_squirtle_doll.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/dolls/unused_wooper_doll.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/dolls/unused_pikachu_doll.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/dolls/unused_porygon2_doll.4bpp,2,2)

# I was lazy: the following sprites need the correct dimensions
$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/dolls/swablu_doll.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/dolls/togepi_doll.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/dolls/torchic_doll.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/dolls/totodile_doll.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/dolls/treecko_doll.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/dolls/wynaut_doll.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/dolls/azurill_doll.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/dolls/baltoy_doll.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/dolls/big_blastoise_doll.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/dolls/big_charizard_doll.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/dolls/big_lapras_doll.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/dolls/big_regice_doll.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/dolls/big_regirock_doll.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/dolls/big_registeel_doll.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/dolls/big_rhydon_doll.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/dolls/big_snorlax_doll.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/dolls/big_venusaur_doll.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/dolls/big_wailmer_doll.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/dolls/chikorita_doll.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/dolls/clefairy_doll.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/dolls/cyndaquil_doll.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/dolls/ditto_doll.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/dolls/duskull_doll.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/dolls/gulpin_doll.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/dolls/jigglypuff_doll.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/dolls/kecleon_doll.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/dolls/lotad_doll.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/dolls/marill_doll.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/dolls/meowth_doll.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/dolls/mudkip_doll.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/dolls/pichu_doll.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/dolls/pikachu_doll.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/dolls/seedot_doll.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/dolls/skitty_doll.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/dolls/smoochum_doll.4bpp,2,2)

# end laziness

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/cushions/zigzag_cushion.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/cushions/ball_cushion.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/cushions/diamond_cushion.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/cushions/fire_cushion.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/cushions/grass_cushion.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/cushions/kiss_cushion.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/cushions/pika_cushion.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/cushions/round_cushion.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/cushions/spin_cushion.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/cushions/water_cushion.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/misc/pushable_boulder.4bpp,2,2)

# got lazy, just didn't include the others as sz

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/ruby_sapphire_brendan/walking.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/ruby_sapphire_brendan/running.4bpp,2,4)


$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/ruby_sapphire_may/walking.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/ruby_sapphire_may/running.4bpp,2,4)


$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/team_aqua/aqua_member_f.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/team_aqua/aqua_member_m.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/team_aqua/archie.4bpp,2,4)


$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/team_magma/magma_member_f.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/team_magma/magma_member_m.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/team_magma/maxie.4bpp,2,4)


$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/artist.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/beauty.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/black_belt.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/boy_1.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/boy_2.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/boy_3.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/rich_boy.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/gameboy_kid.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/bug_catcher.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/cameraman.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/camper.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/contest_judge.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/cook.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/cycling_triathlete_f.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/cycling_triathlete_m.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/fat_man.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/fisherman.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/gentleman.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/girl_1.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/girl_2.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/girl_3.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/hex_maniac.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/hiker.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/hot_springs_old_woman.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/lass.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/leaf.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/ninja_boy.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/little_boy.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/twin.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/little_girl.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/man_1.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/man_2.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/pokefan_m.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/man_3.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/man_4.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/man_5.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/devon_employee.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/maniac.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/mart_employee.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/mauville_old_man_1.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/mauville_old_man_2.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/mom.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/mystery_event_deliveryman.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/nurse.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/expert_m.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/old_man.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/expert_f.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/old_woman.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/picnicker.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/prof_birch.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/psychic_m.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/quinty_plump.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/red.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/reporter_f.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/reporter_m.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/rooftop_sale_woman.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/rs_little_boy.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/running_triathlete_f.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/running_triathlete_m.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/sailor.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/school_kid_m.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/scientist_1.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/scientist_2.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/scott.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/steven.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/swimmer_f.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/swimmer_m.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/teala.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/tuber_f.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/tuber_m.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/tuber_m_swimming.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/union_room_attendant.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/unused_woman.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/wallace.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/wally.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/woman_1.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/pokefan_f.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/woman_2.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/woman_3.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/woman_4.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/link_receptionist.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/woman_5.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/people/youngster.4bpp,2,4)



$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/pokemon_old/azumarill.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/pokemon_old/azurill.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/pokemon_old/deoxys.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/pokemon_old/dusclops.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/pokemon_old/enemy_zigzagoon.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/pokemon_old/groudon.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/pokemon_old/ho_oh.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/pokemon_old/kecleon.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/pokemon_old/kirlia.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/pokemon_old/kyogre.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/pokemon_old/latias_latios.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/pokemon_old/lugia.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/pokemon_old/mew.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/pokemon_old/pikachu.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/pokemon_old/poochyena.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/pokemon_old/rayquaza_cutscene.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/pokemon_old/skitty.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/pokemon_old/sudowoodo_tree.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/pokemon_old/vigoroth_mover.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/pokemon_old/wingull.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/pokemon_old/zigzagoon.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/misc/ball_poke.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/aguav.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/aspear.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/cheri.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/chesto.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/cornn.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/durin.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/figy.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/grepa.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/hondew.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/iapapa.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/kelpsy.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/lansat.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/leppa.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/liechi.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/lum.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/mago.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/nomel.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/oran.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/pamtre.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/pecha.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/persim.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/pomeg.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/rabuta.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/rawst.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/razz.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/sitrus.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/spelon.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/sprout.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/tamato.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/wepear.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/wiki.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/occa.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/yache.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/chople.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/kebia.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/shuca.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/payapa.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/tanga.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/kasib.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/haban.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/colbur.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/roseli.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/custap.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/jaboca.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/rowap.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/berry_trees/micle.4bpp,2,4)


$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/misc/breakable_rock.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/misc/cuttable_tree.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(OBJEVENTGFXDIR)/misc/mr_brineys_boat.4bpp,4,4)



$(call MAKE_SPRITECOMP_RULES,$(FLDEFFGFXDIR)/arrow.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(FLDEFFGFXDIR)/ash.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(FLDEFFGFXDIR)/sparkle.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(FLDEFFGFXDIR)/jump_big_splash.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(FLDEFFGFXDIR)/jump_small_splash.4bpp,2,1)

$(call MAKE_SPRITECOMP_RULES,$(FLDEFFGFXDIR)/jump_tall_grass.4bpp,2,1)

$(call MAKE_SPRITECOMP_RULES,$(FLDEFFGFXDIR)/bike_tire_tracks.4bpp,2,2)


$(call MAKE_SPRITECOMP_RULES,$(FLDEFFGFXDIR)/slither_tracks.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(FLDEFFGFXDIR)/bug_tracks.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(FLDEFFGFXDIR)/spot_tracks.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(FLDEFFGFXDIR)/bubbles.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(FLDEFFGFXDIR)/deep_sand_footprints.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(FLDEFFGFXDIR)/ground_impact_dust.4bpp,2,1)

$(call MAKE_SPRITECOMP_RULES,$(FLDEFFGFXDIR)/ash_puff.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(FLDEFFGFXDIR)/long_grass.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(FLDEFFGFXDIR)/mountain_disguise.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(FLDEFFGFXDIR)/ripple.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(FLDEFFGFXDIR)/sand_disguise_placeholder.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(FLDEFFGFXDIR)/sand_footprints.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(FLDEFFGFXDIR)/short_grass.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(FLDEFFGFXDIR)/surf_blob.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(FLDEFFGFXDIR)/tall_grass.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(FLDEFFGFXDIR)/tree_disguise.4bpp,2,4)

$(call MAKE_SPRITECOMP_RULES,$(FLDEFFGFXDIR)/jump_long_grass.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(FLDEFFGFXDIR)/unknown_17.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(FLDEFFGFXDIR)/unused_grass_2.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(FLDEFFGFXDIR)/unused_sand.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(FLDEFFGFXDIR)/water_surfacing.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(FLDEFFGFXDIR)/sand_pile.4bpp,2,1)

$(call MAKE_SPRITECOMP_RULES,$(FLDEFFGFXDIR)/ash_launch.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(FLDEFFGFXDIR)/small_sparkle.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(FLDEFFGFXDIR)/unused_grass_3.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(FLDEFFGFXDIR)/secret_power_cave.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(FLDEFFGFXDIR)/secret_power_shrub.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(FLDEFFGFXDIR)/secret_power_tree.4bpp,2,2)

$(call MAKE_SPRITECOMP_RULES,$(FLDEFFGFXDIR)/record_mix_lights.4bpp,4,1)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/question_mark/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/bulbasaur/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/ivysaur/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/venusaur/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/venusaur/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/venusaur/mega/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/charmander/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/charmeleon/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/charizard/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/charizard/mega_x/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/charizard/mega_y/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/squirtle/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/wartortle/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/blastoise/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/blastoise/mega/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/caterpie/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/metapod/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/butterfree/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/butterfree/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/weedle/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/kakuna/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/beedrill/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/beedrill/mega/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/pidgey/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/pidgeotto/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/pidgeot/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/pidgeot/mega/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/rattata/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/rattata/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/raticate/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/raticate/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/spearow/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/fearow/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/ekans/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/arbok/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/pikachu/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/pikachu/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/raichu/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/raichu/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/sandshrew/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/sandslash/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/nidoran_f/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/nidorina/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/nidoqueen/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/nidoran_m/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/nidorino/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/nidoking/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/clefairy/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/clefable/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/vulpix/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/ninetales/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/jigglypuff/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/wigglytuff/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/zubat/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/zubat/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/golbat/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/golbat/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/oddish/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/gloom/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/gloom/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/vileplume/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/vileplume/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/paras/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/parasect/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/venonat/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/venomoth/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/diglett/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/dugtrio/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/meowth/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/persian/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/psyduck/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/golduck/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/mankey/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/primeape/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/growlithe/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/arcanine/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/poliwag/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/poliwhirl/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/poliwrath/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/abra/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/kadabra/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/kadabra/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/alakazam/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/alakazam/mega/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/alakazam/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/machop/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/machoke/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/machamp/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/bellsprout/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/weepinbell/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/victreebel/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/tentacool/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/tentacruel/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/geodude/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/graveler/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/golem/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/ponyta/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/rapidash/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/slowpoke/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/slowbro/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/slowbro/mega/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/magnemite/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/magneton/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/farfetchd/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/doduo/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/doduo/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/dodrio/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/dodrio/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/seel/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/dewgong/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/grimer/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/muk/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/shellder/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/cloyster/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/gastly/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/haunter/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/gengar/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/gengar/mega/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/onix/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/drowzee/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/hypno/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/hypno/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/krabby/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/kingler/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/voltorb/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/electrode/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/exeggcute/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/exeggutor/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/cubone/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/marowak/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/hitmonlee/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/hitmonchan/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/lickitung/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/koffing/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/weezing/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/rhyhorn/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/rhyhorn/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/rhydon/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/rhydon/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/chansey/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/tangela/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/kangaskhan/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/kangaskhan/mega/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/horsea/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/seadra/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/goldeen/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/goldeen/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/seaking/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/seaking/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/staryu/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/starmie/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/mr_mime/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/scyther/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/scyther/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/jynx/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/electabuzz/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/magmar/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/pinsir/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/pinsir/mega/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/tauros/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/magikarp/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/magikarp/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/gyarados/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/gyarados/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/gyarados/mega/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/lapras/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/ditto/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/eevee/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/eevee/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/vaporeon/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/jolteon/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/flareon/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/porygon/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/omanyte/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/omastar/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/kabuto/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/kabutops/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/aerodactyl/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/aerodactyl/mega/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/snorlax/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/articuno/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/zapdos/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/moltres/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/dratini/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/dragonair/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/dragonite/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/mewtwo/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/mewtwo/mega_x/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/mewtwo/mega_y/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/mew/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/chikorita/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/bayleef/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/meganium/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/meganium/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/cyndaquil/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/quilava/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/typhlosion/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/totodile/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/croconaw/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/feraligatr/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/sentret/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/furret/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/hoothoot/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/noctowl/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/ledyba/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/ledyba/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/ledian/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/ledian/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/spinarak/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/ariados/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/crobat/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/chinchou/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/lanturn/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/pichu/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/cleffa/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/igglybuff/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/togepi/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/togetic/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/natu/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/xatu/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/xatu/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/mareep/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/flaaffy/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/ampharos/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/ampharos/mega/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/bellossom/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/marill/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/azumarill/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/sudowoodo/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/sudowoodo/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/politoed/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/politoed/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/hoppip/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/skiploom/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/jumpluff/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/aipom/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/aipom/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/sunkern/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/sunflora/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/yanma/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/wooper/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/wooper/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/quagsire/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/quagsire/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/espeon/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/umbreon/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/murkrow/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/murkrow/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/slowking/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/misdreavus/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/unown/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/unown/b/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/unown/c/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/unown/d/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/unown/e/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/unown/f/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/unown/g/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/unown/h/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/unown/i/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/unown/j/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/unown/k/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/unown/l/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/unown/m/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/unown/n/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/unown/o/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/unown/p/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/unown/q/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/unown/r/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/unown/s/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/unown/t/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/unown/u/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/unown/v/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/unown/w/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/unown/x/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/unown/y/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/unown/z/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/unown/exclamation/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/unown/question/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/wobbuffet/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/wobbuffet/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/girafarig/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/girafarig/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/pineco/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/forretress/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/dunsparce/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/gligar/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/gligar/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/steelix/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/steelix/overworldf.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/steelix/mega/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/snubbull/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/granbull/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/qwilfish/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/scizor/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/scizor/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/scizor/mega/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/shuckle/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/heracross/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/heracross/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/heracross/mega/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/sneasel/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/sneasel/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/teddiursa/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/ursaring/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/ursaring/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/slugma/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/magcargo/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/swinub/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/piloswine/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/piloswine/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/corsola/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/remoraid/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/octillery/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/octillery/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/delibird/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/mantine/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/skarmory/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/houndour/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/houndoom/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/houndoom/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/houndoom/mega/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/kingdra/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/phanpy/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/donphan/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/donphan/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/porygon2/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/stantler/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/smeargle/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/tyrogue/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/hitmontop/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/smoochum/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/elekid/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/magby/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/miltank/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/blissey/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/raikou/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/entei/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/suicune/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/larvitar/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/pupitar/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/tyranitar/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/tyranitar/mega/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/lugia/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/ho_oh/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/celebi/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/treecko/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/grovyle/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/sceptile/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/sceptile/mega/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/torchic/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/torchic/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/combusken/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/combusken/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/blaziken/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/blaziken/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/blaziken/mega/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/mudkip/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/marshtomp/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/swampert/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/swampert/mega/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/poochyena/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/mightyena/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/zigzagoon/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/linoone/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/wurmple/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/silcoon/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/beautifly/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/beautifly/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/cascoon/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/dustox/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/dustox/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/lotad/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/lombre/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/ludicolo/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/ludicolo/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/seedot/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/nuzleaf/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/nuzleaf/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/shiftry/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/shiftry/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/taillow/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/swellow/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/wingull/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/pelipper/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/ralts/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/kirlia/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/gardevoir/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/gardevoir/mega/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/surskit/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/masquerain/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/shroomish/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/breloom/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/slakoth/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/vigoroth/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/slaking/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/nincada/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/ninjask/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/shedinja/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/whismur/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/loudred/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/exploud/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/makuhita/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/hariyama/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/azurill/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/nosepass/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/skitty/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/delcatty/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/sableye/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/sableye/mega/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/mawile/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/mawile/mega/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/aron/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/lairon/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/aggron/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/aggron/mega/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/meditite/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/meditite/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/medicham/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/medicham/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/medicham/mega/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/electrike/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/manectric/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/manectric/mega/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/plusle/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/minun/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/volbeat/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/illumise/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/roselia/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/roselia/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/gulpin/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/gulpin/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/swalot/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/swalot/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/carvanha/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/sharpedo/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/sharpedo/mega/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/wailmer/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/wailord/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/numel/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/numel/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/camerupt/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/camerupt/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/camerupt/mega/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/torkoal/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/spoink/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/grumpig/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/spinda/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/trapinch/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/vibrava/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/flygon/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/cacnea/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/cacturne/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/cacturne/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/swablu/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/altaria/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/altaria/mega/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/zangoose/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/seviper/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/lunatone/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/solrock/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/barboach/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/whiscash/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/corphish/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/crawdaunt/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/baltoy/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/claydol/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/lileep/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/cradily/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/anorith/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/armaldo/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/feebas/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/milotic/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/milotic/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/castform/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/castform/sunny/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/castform/rainy/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/castform/snowy/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/kecleon/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/shuppet/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/banette/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/banette/mega/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/duskull/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/dusclops/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/tropius/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/chimecho/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/absol/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/absol/mega/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/wynaut/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/snorunt/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/glalie/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/glalie/mega/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/spheal/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/sealeo/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/walrein/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/clamperl/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/huntail/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/gorebyss/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/relicanth/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/relicanth/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/luvdisc/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/bagon/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/shelgon/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/salamence/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/salamence/mega/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/beldum/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/metang/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/metagross/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/metagross/mega/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/regirock/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/regice/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/registeel/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/latias/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/latias/mega/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/latios/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/latios/mega/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/kyogre/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/kyogre/primal/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/groudon/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/groudon/primal/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/rayquaza/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/rayquaza/mega/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/jirachi/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/deoxys/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/turtwig/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/grotle/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/torterra/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/chimchar/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/monferno/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/infernape/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/piplup/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/prinplup/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/empoleon/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/starly/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/starly/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/staravia/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/staravia/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/staraptor/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/staraptor/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/bidoof/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/bidoof/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/bibarel/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/bibarel/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/kricketot/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/kricketot/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/kricketune/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/kricketune/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/shinx/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/shinx/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/luxio/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/luxio/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/luxray/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/luxray/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/budew/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/roserade/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/roserade/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/cranidos/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/rampardos/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/shieldon/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/bastiodon/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/burmy/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/wormadam/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/mothim/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/combee/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/combee/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/vespiquen/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/pachirisu/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/pachirisu/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/buizel/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/buizel/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/floatzel/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/floatzel/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/cherubi/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/cherrim/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/shellos/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/gastrodon/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/ambipom/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/ambipom/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/drifloon/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/drifblim/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/buneary/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/lopunny/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/lopunny/mega/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/mismagius/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/honchkrow/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/glameow/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/purugly/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/chingling/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/stunky/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/skuntank/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/bronzor/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/bronzong/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/bonsly/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/mime_jr/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/happiny/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/chatot/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/spiritomb/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/gible/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/gible/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/gabite/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/gabite/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/garchomp/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/garchomp/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/garchomp/mega/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/munchlax/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/riolu/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/lucario/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/lucario/mega/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/hippopotas/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/hippopotas/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/hippowdon/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/hippowdon/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/skorupi/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/drapion/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/croagunk/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/croagunk/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/toxicroak/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/toxicroak/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/carnivine/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/finneon/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/finneon/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/lumineon/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/lumineon/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/mantyke/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/snover/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/snover/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/abomasnow/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/abomasnow/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/abomasnow/mega/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/weavile/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/weavile/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/magnezone/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/lickilicky/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/rhyperior/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/rhyperior/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/tangrowth/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/tangrowth/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/electivire/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/magmortar/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/togekiss/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/yanmega/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/leafeon/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/glaceon/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/gliscor/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/mamoswine/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/mamoswine/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/porygon_z/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/gallade/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/gallade/mega/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/probopass/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/dusknoir/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/froslass/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/rotom/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/uxie/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/mesprit/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/azelf/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/dialga/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/palkia/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/heatran/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/regigigas/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/giratina/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/cresselia/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/phione/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/manaphy/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/darkrai/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/shaymin/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/arceus/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/victini/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/snivy/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/servine/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/serperior/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/tepig/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/pignite/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/emboar/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/oshawott/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/dewott/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/samurott/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/patrat/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/watchog/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/lillipup/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/herdier/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/stoutland/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/purrloin/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/liepard/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/pansage/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/simisage/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/pansear/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/simisear/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/panpour/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/simipour/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/munna/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/musharna/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/pidove/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/tranquill/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/unfezant/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/unfezant/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/blitzle/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/zebstrika/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/roggenrola/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/boldore/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/gigalith/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/woobat/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/swoobat/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/drilbur/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/excadrill/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/audino/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/audino/mega/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/timburr/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/gurdurr/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/conkeldurr/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/tympole/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/palpitoad/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/seismitoad/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/throh/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/sawk/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/sewaddle/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/swadloon/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/leavanny/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/venipede/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/whirlipede/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/scolipede/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/cottonee/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/whimsicott/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/petilil/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/lilligant/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/basculin/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/sandile/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/krokorok/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/krookodile/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/darumaka/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/darmanitan/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/maractus/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/dwebble/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/crustle/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/scraggy/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/scrafty/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/sigilyph/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/yamask/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/cofagrigus/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/tirtouga/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/carracosta/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/archen/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/archeops/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/trubbish/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/garbodor/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/zorua/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/zoroark/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/minccino/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/cinccino/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/gothita/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/gothorita/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/gothitelle/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/solosis/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/duosion/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/reuniclus/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/ducklett/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/swanna/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/vanillite/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/vanillish/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/vanilluxe/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/deerling/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/sawsbuck/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/emolga/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/karrablast/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/escavalier/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/foongus/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/amoonguss/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/frillish/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/frillish/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/jellicent/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/jellicent/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/alomomola/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/joltik/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/galvantula/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/ferroseed/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/ferrothorn/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/klink/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/klang/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/klinklang/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/tynamo/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/eelektrik/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/eelektross/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/elgyem/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/beheeyem/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/litwick/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/lampent/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/chandelure/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/axew/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/fraxure/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/haxorus/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/cubchoo/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/beartic/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/cryogonal/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/shelmet/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/accelgor/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/stunfisk/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/mienfoo/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/mienshao/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/druddigon/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/golett/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/golurk/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/pawniard/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/bisharp/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/bouffalant/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/rufflet/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/braviary/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/vullaby/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/mandibuzz/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/heatmor/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/durant/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/deino/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/zweilous/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/hydreigon/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/larvesta/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/volcarona/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/cobalion/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/terrakion/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/virizion/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/tornadus/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/thundurus/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/reshiram/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/zekrom/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/landorus/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/kyurem/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/keldeo/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/meloetta/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/genesect/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/chespin/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/quilladin/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/chesnaught/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/fennekin/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/braixen/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/delphox/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/froakie/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/frogadier/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/greninja/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/bunnelby/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/diggersby/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/fletchling/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/fletchinder/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/talonflame/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/scatterbug/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/spewpa/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/vivillon/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/litleo/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/pyroar/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/pyroar/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/flabebe/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/floette/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/florges/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/skiddo/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/gogoat/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/pancham/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/pangoro/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/furfrou/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/espurr/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/meowstic/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/meowstic/f/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/honedge/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/doublade/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/aegislash/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/spritzee/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/aromatisse/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/swirlix/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/slurpuff/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/inkay/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/malamar/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/binacle/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/barbaracle/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/skrelp/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/dragalge/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/clauncher/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/clawitzer/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/helioptile/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/heliolisk/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/tyrunt/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/tyrantrum/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/amaura/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/aurorus/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/sylveon/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/hawlucha/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/dedenne/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/carbink/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/goomy/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/sliggoo/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/goodra/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/klefki/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/phantump/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/trevenant/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/pumpkaboo/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/gourgeist/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/bergmite/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/avalugg/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/noibat/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/noivern/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/xerneas/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/xerneas/active/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/yveltal/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/zygarde/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/diancie/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/diancie/mega/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/hoopa/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/volcanion/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/rowlet/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/dartrix/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/decidueye/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/litten/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/torracat/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/incineroar/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/popplio/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/brionne/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/primarina/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/pikipek/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/trumbeak/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/toucannon/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/yungoos/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/gumshoos/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/grubbin/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/charjabug/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/vikavolt/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/crabrawler/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/crabominable/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/oricorio/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/cutiefly/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/ribombee/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/rockruff/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/lycanroc/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/lycanroc/dusk/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/lycanroc/midnight/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/wishiwashi/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/mareanie/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/toxapex/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/mudbray/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/mudsdale/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/dewpider/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/araquanid/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/fomantis/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/lurantis/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/morelull/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/shiinotic/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/salandit/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/salazzle/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/stufful/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/bewear/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/bounsweet/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/steenee/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/tsareena/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/comfey/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/oranguru/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/passimian/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/wimpod/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/golisopod/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/sandygast/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/palossand/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/pyukumuku/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/type_null/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/silvally/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/minior/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/komala/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/turtonator/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/togedemaru/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/mimikyu/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/bruxish/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/drampa/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/dhelmise/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/jangmo_o/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/hakamo_o/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/kommo_o/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/tapu_koko/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/tapu_lele/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/tapu_bulu/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/tapu_fini/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/cosmog/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/cosmoem/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/solgaleo/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/lunala/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/nihilego/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/buzzwole/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/pheromosa/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/xurkitree/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/celesteela/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/kartana/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/guzzlord/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/necrozma/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/necrozma/dawn_wings/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/necrozma/dusk_mane/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/necrozma/ultra/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/magearna/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/marshadow/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/poipole/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/naganadel/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/stakataka/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/blacephalon/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/zeraora/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/meltan/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/melmetal/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/grookey/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/thwackey/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/rillaboom/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/scorbunny/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/raboot/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/cinderace/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/sobble/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/drizzile/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/inteleon/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/skwovet/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/greedent/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/rookidee/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/corvisquire/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/corviknight/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/blipbug/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/dottler/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/orbeetle/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/nickit/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/thievul/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/gossifleur/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/eldegoss/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/wooloo/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/dubwool/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/chewtle/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/drednaw/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/yamper/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/boltund/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/rolycoly/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/carkol/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/coalossal/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/applin/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/flapple/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/appletun/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/silicobra/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/sandaconda/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/cramorant/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/arrokuda/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/barraskewda/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/toxel/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/toxtricity/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/toxtricity/low_key/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/sizzlipede/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/centiskorch/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/clobbopus/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/grapploct/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/sinistea/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/polteageist/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/hatenna/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/hattrem/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/hatterene/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/impidimp/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/morgrem/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/grimmsnarl/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/obstagoon/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/perrserker/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/cursola/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/sirfetchd/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/mr_rime/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/runerigus/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/milcery/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/alcremie/strawberry/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/falinks/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/pincurchin/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/snom/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/frosmoth/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/stonjourner/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/eiscue/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/indeedee/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/indeedee/f/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/morpeko/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/cufant/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/copperajah/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/dracozolt/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/arctozolt/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/dracovish/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/arctovish/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/duraludon/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/dreepy/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/drakloak/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/dragapult/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/zacian/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/zacian/crowned_sword/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/zamazenta/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/zamazenta/crowned_shield/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/eternatus/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/kubfu/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/urshifu/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/zarude/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/regieleki/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/regidrago/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/glastrier/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/spectrier/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/calyrex/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/calyrex/shadow/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/calyrex/ice/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/zapdos/galar/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/meowth/galar/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/ponyta/galar/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/rapidash/galar/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/slowpoke/galar/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/slowbro/galar/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/farfetchd/galar/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/weezing/galar/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/mr_mime/galar/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/articuno/galar/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/moltres/galar/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/slowking/galar/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/corsola/galar/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/zigzagoon/galar/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/linoone/galar/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/darumaka/galar/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/darmanitan/galar_standard/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/yamask/galar/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/stunfisk/galar/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/growlithe/hisui/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/arcanine/hisui/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/voltorb/hisui/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/electrode/hisui/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/braviary/hisui/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/qwilfish/hisui/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/sneasel/hisui/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/sneasel/hisui/overworldf.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/zorua/hisui/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/zoroark/hisui/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/samurott/hisui/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/lilligant/hisui/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/sliggoo/hisui/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/goodra/hisui/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/avalugg/hisui/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/decidueye/hisui/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/typhlosion/hisui/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/dialga/origin/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/palkia/origin/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/wyrdeer/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/kleavor/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/basculin/white_striped/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/basculegion/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/basculegion/f/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/ursaluna/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/sneasler/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/overqwil/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/enamorus/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/enamorus/therian/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/pichu/spiky_eared/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/deoxys/attack/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/deoxys/defense/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/deoxys/speed/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/burmy/sandy/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/burmy/trash/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/wormadam/sandy/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/wormadam/trash/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/shellos/east/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/gastrodon/east/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/rotom/heat/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/rotom/wash/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/rotom/frost/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/rotom/fan/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/rotom/mow/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/giratina/origin/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/arceus/fighting/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/arceus/flying/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/arceus/poison/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/arceus/ground/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/arceus/rock/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/arceus/bug/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/arceus/ghost/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/arceus/steel/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/arceus/fire/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/arceus/water/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/arceus/grass/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/arceus/electric/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/arceus/psychic/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/arceus/ice/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/arceus/dragon/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/arceus/dark/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/arceus/fairy/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/basculin/blue_striped/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/deerling/autumn/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/deerling/summer/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/deerling/winter/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/sawsbuck/autumn/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/sawsbuck/summer/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/sawsbuck/winter/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/meloetta/pirouette/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/vivillon/polar/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/vivillon/tundra/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/vivillon/continental/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/vivillon/garden/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/vivillon/elegant/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/vivillon/modern/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/vivillon/marine/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/vivillon/archipelago/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/vivillon/high_plains/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/vivillon/sandstorm/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/vivillon/river/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/vivillon/monsoon/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/vivillon/savanna/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/vivillon/sun/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/vivillon/ocean/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/vivillon/jungle/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/vivillon/fancy/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/vivillon/poke_ball/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/vivillon/meadow/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/flabebe/yellow/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/flabebe/blue/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/flabebe/orange/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/flabebe/white/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/floette/yellow/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/floette/blue/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/floette/orange/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/floette/white/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/floette/eternal/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/florges/yellow/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/florges/blue/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/florges/orange/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/florges/white/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/furfrou/heart/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/furfrou/star/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/furfrou/diamond/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/furfrou/debutante/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/furfrou/matron/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/furfrou/dandy/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/furfrou/la_reine/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/furfrou/kabuki/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/furfrou/pharaoh/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/hoopa/unbound/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/rattata/alola/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/raticate/alola/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/raichu/alola/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/sandshrew/alola/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/sandslash/alola/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/vulpix/alola/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/ninetales/alola/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/diglett/alola/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/dugtrio/alola/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/meowth/alola/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/persian/alola/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/geodude/alola/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/graveler/alola/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/golem/alola/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/grimer/alola/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/muk/alola/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/exeggutor/alola/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/marowak/alola/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/wooper/paldea/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/clodsire/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/sprigatito/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/floragato/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/meowscarada/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/fuecoco/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/crocalor/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/skeledirge/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/quaxly/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/quaxwell/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/quaquaval/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/lechonk/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/oinkologne/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/oinkologne/f/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/tarountula/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/spidops/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/nymble/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/lokix/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/pawmi/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/pawmo/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/pawmot/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/tandemaus/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/maushold/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/maushold/four/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/fidough/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/dachsbun/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/smoliv/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/dolliv/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/arboliva/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/squawkabilly/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/squawkabilly/blue/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/squawkabilly/white/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/squawkabilly/yellow/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/nacli/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/naclstack/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/garganacl/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/charcadet/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/armarouge/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/ceruledge/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/tadbulb/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/bellibolt/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/wattrel/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/kilowattrel/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/maschiff/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/mabosstiff/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/shroodle/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/grafaiai/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/bramblin/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/brambleghast/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/toedscool/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/toedscruel/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/klawf/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/capsakid/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/scovillain/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/rellor/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/rabsca/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/flittle/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/espathra/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/tinkatink/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/tinkatuff/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/tinkaton/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/wiglett/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/wugtrio/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/bombirdier/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/finizen/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/palafin/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/palafin/hero/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/varoom/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/revavroom/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/cyclizar/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/orthworm/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/glimmet/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/glimmora/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/greavard/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/houndstone/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/flamigo/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/cetoddle/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/cetitan/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/kingambit/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/veluza/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/dondozo/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/tatsugiri/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/tatsugiri/droopy/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/tatsugiri/stretchy/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/annihilape/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/farigiraf/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/dudunsparce/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/dudunsparce/three_segment/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/great_tusk/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/scream_tail/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/brute_bonnet/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/slither_wing/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/flutter_mane/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/sandy_shocks/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/iron_treads/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/iron_bundle/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/iron_hands/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/iron_jugulis/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/iron_moth/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/iron_thorns/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/frigibax/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/arctibax/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/baxcalibur/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/gimmighoul/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/gholdengo/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/wo_chien/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/chien_pao/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/ting_lu/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/chi_yu/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/roaring_moon/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/iron_valiant/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/koraidon/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/miraidon/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/iron_leaves/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/walking_wake/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/dipplin/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/poltchageist/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/sinistcha/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/okidogi/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/munkidori/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/fezandipiti/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/ogerpon/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/ogerpon/cornerstone/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/ogerpon/hearthflame/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/ogerpon/wellspring/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/hydrapple/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/archaludon/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/gouging_fire/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/raging_bolt/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/iron_boulder/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/iron_crown/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/terapagos/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/terapagos/terastal/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/pecharunt/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/tauros/paldea_aqua/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/tauros/paldea_blaze/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/tauros/paldea_combat/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/ursaluna/bloodmoon/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/shaymin/sky/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/oricorio/pom_pom/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/oricorio/pau/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/oricorio/sensu/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/zygarde/10_percent/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/zygarde/complete/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/magearna/original_color/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/kyurem/white/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/kyurem/black/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/tornadus/therian/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/thundurus/therian/overworld.4bpp,8,8)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/landorus/therian/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/pumpkaboo/small/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/pumpkaboo/large/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/pumpkaboo/super/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/gourgeist/small/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/gourgeist/large/overworld.4bpp,4,4)

$(call MAKE_SPRITECOMP_RULES,$(POKEMONGFXDIR)/gourgeist/super/overworld.4bpp,4,4)

$(MISCGFXDIR)/emotes.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -mwidth 2 -mheight 2

# All pokeballs are 16x32
$(OBJEVENTGFXDIR)/misc/ball_%.4bpp: $(OBJEVENTGFXDIR)/misc/ball_%.png ; $(GFX) $< $@ -mwidth 2 -mheight 4

graphics/door_anims/battle_tower_multi_corridor.4bpp: %.4bpp: %.png
	$(GFX) $< $@ -mwidth 2 -mheight 4
