vcf_files = {
	"PBUS.xml",
	"POLICE3.xml",
	"POLICE.xml",
	"POLICE2.xml",
	"FLATBED.xml",
	"POLICE5.xml",
	"FBI.xml",
	"FBI2.xml",
	"SHERIFF.xml",
	"POLICE7.xml",
	"POLICEB1.xml",
	"POLICEOLD5.xml",
	"audiems.xml",
	"riot.xml",
	"POLICE6.xml",
	"AMBUCAR.xml",
	"TOWTRUCK2.xml",
	"FBI3.xml",
	"POLICE4.xml",
	"POLICEGT350R.xml",
	"servicemech.xml",
	"AMBULANCE.xml",
	"pranger.xml",
	"AMBULANCE2.xml",
	"AKUT.xml",
	"POLICERS6.xml",
	"FBIRS6.xml",
	"POLICEB2.xml",
	"SHERIFF2.xml",
	"EMSRS6.xml",
	"EMSTESLA.xml",
	"fbi.xml",
	"fbi2.xml",
	"ml63.xml",
	"KEVIN.xml",
	"DUNE2.xml",
	"EMSMERC.xml",
	"TOURANC.xml",
	"POLICEB3.xml"
}

pattern_files = {
	"WIGWAG.xml",
	"WIGWAG3.xml",
	"FAST.xml",
	"COMPLEX.xml",
	"BACKFOURTH.xml",
	"BACKFOURTH2.xml",
	"T_ADVIS_RIGHT_LEFT.xml",
	"T_ADVIS_LEFT_RIGHT.xml",
	"T_ADVIS_BACKFOURTH.xml",
	"WIGWAG5.xml"
}

modelsWithTrafficAdvisor = {
	"PBUS.xml",
	"POLICE3.xml",
	"POLICE.xml",
	"POLICE2.xml",
	"FLATBED.xml",
	"POLICE5.xml",
	"FBI.xml",
	"FBI2.xml",
	"SHERIFF.xml",
	"FBI3.xml",
	"POLICE7.xml",
	"POLICEB1.xml",
	"servicemech.xml",
	"POLICEOLD5.xml",
	"POLICE6.xml",
	"AMBUCAR.xml",
	"TOWTRUCK2.xml",
	"POLICEGT350R.xml",
	"AMBULANCE.xml",
	"AMBULANCE2.xml",
	"AKUT.xml",
	"POLICERS6.xml",
	"FBIRS6.xml",
	"POLICEB2.xml",
	"SHERIFF2.xml",
	"KEVIN.xml",
	"DUNE2.xml",
	"EMSMERC.xml",
	"TOURANC.xml",
	"POLICEB3.xml"
}

modelsWithFireSiren =
{
    "FIRETRUK",
}

modelsWithAmbWarnSiren =
{   
    "AMBULANCE",
	"AMBUCAR",
	"AKUT2",
    "FIRETRUK",
    "LGUARD",
}

stagethreewithsiren = false
playButtonPressSounds = true
vehicleStageThreeAdvisor = {
    "PBUS.xml",
	"POLICE3.xml",
	"POLICE.xml",
	"POLICE2.xml",
	"FLATBED.xml",
	"POLICE5.xml",
	"FBI.xml",
	"FBI2.xml",
	"SHERIFF.xml",
	"POLICE7.xml",
	"POLICEB1.xml",
	"POLICEOLD5.xml",
	"servicemech.xml",
	"POLICE6.xml",
	"AMBUCAR.xml",
	"TOWTRUCK2.xml",
	"POLICEGT350R.xml",
	"AMBULANCE.xml",
	"FBI3.xml",
	"AMBULANCE2.xml",
	"AKUT.xml",
	"POLICERS6.xml",
	"FBIRS6.xml",
	"POLICEB2.xml",
	"SHERIFF2.xml",
	"KEVIN.xml",
	"DUNE2.xml",
	"EMSMERC.xml",
	"TOURANC.xml",
	"POLICEB3.xml"
}


vehicleSyncDistance = 150
envirementLightBrightness = 0.2

build = "master"

shared = {
	horn = 86,
}

keyboard = {
	modifyKey = 132,
	stageChange = 85,
	guiKey = 243,
	takedown = 245,
	siren = {
		tone_one = 157,
		tone_two = 158,
		tone_three = 160,
		dual_toggle = 164,
		dual_one = 165,
		dual_two = 159,
		dual_three = 161,
	},
	pattern = {
		primary = 246,
		secondary = 303,
		advisor = 182,
	},
}

controller = {
	modifyKey = 73,
	stageChange = 80,
	takedown = 74,
	siren = {
		tone_one = 173,
		tone_two = 85,
		tone_three = 172,
	},
}