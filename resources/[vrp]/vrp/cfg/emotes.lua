
-- define emotes
-- use the custom emotes admin action to test emotes on-the-fly
-- animation list: http://docs.ragepluginhook.net/html/62951c37-a440-478c-b389-c471230ddfc5.htm

local cfg = {}

-- map of emote_name => {upper,seq,looping} and an optional permissions property
-- seq can also be a task definition, check the examples below
cfg.emotes69 = {
  ["Nej"] = {
    true, {{"gestures@f@standing@casual","gesture_head_no",1}}, false
  },
  ["Satans"] = {
    true, {{"gestures@f@standing@casual","gesture_damn",1}}, false
  },
  ["Dans"] = {
    false, {
      {"rcmnigel1bnmt_1b","dance_intro_tyler",1},
      {"rcmnigel1bnmt_1b","dance_loop_tyler",1}
    }, false
  },
  ["Rock"] = {true,{{"mp_player_introck","mp_player_int_rock",1}},false},
  ["Sid på stol"] = {false, {task="PROP_HUMAN_SEAT_CHAIR_MP_PLAYER"}, false},
  ["Politi"] = {false, {task="WORLD_HUMAN_COP_IDLES"}, false},
  ["Kikkert"] = {false, {task="WORLD_HUMAN_BINOCULARS"}, false},
  ["Klap"] = {false, {task="WORLD_HUMAN_CHEERING"}, false},
  ["Drik"] = {false, {task="WORLD_HUMAN_DRINKING"}, false},
  ["Ryg"] = {false, {task="WORLD_HUMAN_SMOKING"}, false},
  ["Film"] = {false, {task="WORLD_HUMAN_MOBILE_FILM_SHOCKING"}, false},
  ["Plant"] = {false, {task="WORLD_HUMAN_GARDENER_PLANT"}, false},
  ["Lig på siden"] = {false, {task="WORLD_HUMAN_BUM_SLUMPED"}, false},
  ["Vagt"] = {false, {task="WORLD_HUMAN_GUARD_STAND"}, false},
  ["Hammer"] = {false, {task="WORLD_HUMAN_HAMMERING"}, false},
  ["Hæng ud"] = {false, {task="WORLD_HUMAN_HANG_OUT_STREET"}, false},
  ["Fix"] = {false, {task="WORLD_HUMAN_VEHICLE_MECHANIC"}, false},
  ["Læn dig"] = {false, {task="WORLD_HUMAN_LEANING"}, false},
  ["Flex"] = {false, {task="WORLD_HUMAN_MUSCLE_FLEX"}, false},
  ["Kamera"] = {false, {task="WORLD_HUMAN_PAPARAZZI"}, false},
  ["Sid"] = {false, {task="WORLD_HUMAN_PICNIC"}, false},
  ["Luder"] = {false, {task="WORLD_HUMAN_PROSTITUTE_HIGH_CLASS"}, false},
  ["Luder 2"] = {false, {task="WORLD_HUMAN_PROSTITUTE_LOW_CLASS"}, false},
  ["Armbøjninger"] = {false, {task="WORLD_HUMAN_PUSH_UPS"}, false},
  ["Mavebøjninger"] = {false, {task="WORLD_HUMAN_SIT_UPS"}, false},
  ["Fisk"] = {false, {task="WORLD_HUMAN_STAND_FISHING"}, false},
  ["Mobil"] = {false, {task="WORLD_HUMAN_STAND_MOBILE"}, false},
  ["Diggit"] = {false, {task="WORLD_HUMAN_STRIP_WATCH_STAND"}, false},
  ["Læg dig på ryggen"] = {false, {task="WORLD_HUMAN_SUNBATHE_BACK"}, false},
  ["Læg dig på maven"] = {false, {task="WORLD_HUMAN_SUNBATHE"}, false},
  ["Svejs"] = {false, {task="WORLD_HUMAN_WELDING"}, false},
  ["Knæl"] = {false, {task="CODE_HUMAN_MEDIC_KNEEL"}, false},
  ["Stå som vagt"] = {false, {task="CODE_HUMAN_POLICE_CROWD_CONTROL"}, false},
  ["Undersøg2"] = {false, {task="CODE_HUMAN_POLICE_INVESTIGATE"}, false},
  ["Notesbog"] = {false, {task="WORLD_HUMAN_CLIPBOARD"}, false},
  ["Utålmodig"] = {false, {task="WORLD_HUMAN_STAND_IMPATIENT"}, false},
  ["Selfie"] = {false, {task="WORLD_HUMAN_TOURIST_MOBILE"}, false},
  ["Musik"] = {false, {task="WORLD_HUMAN_MUSICIAN"}, false},
  ["Drik øl"] = {false, {task="WORLD_HUMAN_PARTYING"}, false},
  ["Yoga"] = {false, {task="WORLD_HUMAN_YOGA"}, false},
  ["Kort"] = {false, {task="WORLD_HUMAN_TOURIST_MAP"}, false}, 
}

return cfg
