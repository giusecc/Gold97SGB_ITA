landmark: MACRO
; x, y, name
	db \1 + 8, \2 + 16
	dw \3
ENDM

Landmarks:
; entries correspond to constants/landmark_constants.asm
	dbbw       0,   0, SpecialMapName
	landmark  92, 116, SilentTownName
	landmark  84, 116, Route101Name
	landmark  76, 116, SilentHillsName
	landmark  76, 100, PagotaCityName
	landmark  75,  99, FiveFloorTowerName
	landmark  68, 100, Route102Name
	landmark  60, 100, WestportCityName
	landmark  59,  99, RadioTowerName
	landmark  60,  84, Route103Name
	landmark  60,  68, BirdonTownName
	landmark  59,  67, SlowpokeWellName
	landmark  60,  60, Route116Name
	landmark  56,  60, Route117Name
	landmark  52,  60, EndonCaveName
	landmark  44,  60, SanskritTownName
	landmark  44,  52, RuinsOfAlphName
	landmark  32,  60, Route118Name
	landmark  20,  60, SunpointCityName
	landmark  19,  59, MagmaShaftName
	landmark  20,  52, SunpointDocksName
	landmark  20,  76, Route119Name
	landmark  28,  92, BoulderMineName
	landmark  36,  92, Route120Name
	landmark  44,  92, TeknosCityName
	landmark  44,  76, BoardwalkName
	landmark  76,  68, Route104Name
	landmark  92,  68, Route105Name
	landmark  92,  76, JadeForestName
	landmark 100,  76, Route106Name
	landmark 108,  76, AlloyCityName
	landmark 108,  64, Route107Name
	landmark 108,  52, KobanIslandName
	landmark 107,  51, DragonsDenName
	landmark 116,  76, Route108Name
	landmark 124,  68, Route109Name
	landmark 124,  60, AmpareCavernName
	landmark 128,  52, Route110Name
	landmark 140,  52, BlueForestName
	landmark 139,  51, IcePathName
	landmark 140,  40, Route111Name
	landmark 139,  39, WhirlIslandsName
	landmark 140,  28, FrostpointTownName
	landmark 140,  68, Route112Name
	landmark 140,  84, StandCityName
	landmark 132,  84, NationalParkName
	landmark 140, 100, Route113Name
	landmark 132, 116, Route114Name
	landmark 124, 116, KantoRegionName
	landmark 108, 116, Route115Name
	landmark  92, 108, VictoryRoadName
	landmark  92, 100, CrownCityName
	landmark  92,  92, MountFujiName
	landmark 123, 115, BattleTowerName
	landmark 108, 108, MtMortarName
	landmark  92, 112, Route121Name
	landmark  80, 116, RouteU8UName
	landmark  36,  68, RouteU7UName
	landmark  28,  44, FujiSummitName
	landmark  28,  92, RouteU6UName
	landmark  20,  68, RouteU5UName
	landmark  92,  44, RouteU4UName
	landmark 120,  44, UnusedRoute1Name
	landmark 132,  64, UnusedPathName
	landmark  52,  92, TropicalIslandJungleName
	landmark 132,  68, LavenderTownName
	landmark  20, 124, RainbowIslandName
	landmark  52, 124, TropicalIslandName
	landmark  36, 124, ForkedStraitName
	landmark  36, 100, KumeCityName
	landmark  36,  92, IcedCavernName
	landmark  44, 100, KumePointName
	landmark  60, 100, KeramaStraitName
	landmark 132, 100, DaitoRanchName
	landmark 112, 100, GreatEastStraitName
	landmark  84, 100, NanjoForestName
	landmark  76,  96, UrasoeTrailName
	landmark  76,  84, UrasoeParkName
	landmark  76,  76, RyukyuCityName
	landmark  92,  68, CharredSummitName
	landmark  84,  68, MeridianPathName
	landmark  36,  44, HydroPlantName
	landmark  40,  52, WeatheredTrailName
	landmark  52,  52, IejimaTown
	landmark  68,  52, MotobuPathName
	landmark  84,  52, NagoVillageName
	landmark  96,  52, IsenStraitName
	landmark 112,  52, SeasidePathName
	landmark 124,  52, JouleCaveName
	landmark 140,  28, KikaiCalderaName
	landmark 140,  36, KikaiVillageName
	landmark 140,  44, KikaiStraitName
	landmark 128,  44, TatsugoPathName
	landmark 116,  44, AmamiTownName
	landmark  36, 124, FastShipName

SilentTownName:     db "BORGO¯SILENTE@"
CrownCityName: db "DIADEMOPOLI@"
PagotaCityName:      db "CIPRESSOPOLI@"
BirdonTownName:      db "AVIOPOLI@"
WestportCityName:   db "PORTOVEST@"
TeknosCityName:    db "TECNOPOLI@"
AlloyCityName:     db "DESMOPOLI@"
SunpointCityName:    db "ELIOPOLI@"
SanskritTownName:    db "VESTIGIA@"
BlueForestName:  db "CILESTROPOLI@"
KikaiVillageName:      db "VILAGGIO¯ARCANO@"
DaitoRanchName:      db "FATTORIA¯DAITO@"
FiveFloorTowerName:     db "PENTATORRE@"
RuinsOfAlphName:     db "ROVINE¯VESTIGIA@"
BoulderMineName:       db "CAVA¯ROCCIOSA@"
SlowpokeWellName:    db "POZZO¯SLOWPOKE@"
RadioTowerName:      db "TORRE RADIO@"
HydroPlantName:      db "IMPIANTO¯ELETTRICO@"
NationalParkName:    db "PARCO¯NAZIONALE@"
TropicalIslandName:        db "ISOLA¯TROPICALE@"
EndonCaveName:      db "GROTTA¯LIMITE@"
WhirlIslandsName:    db "ISOLE¯VORTICOSE@"
MtMortarName:        db "@"
DragonsDenName:      db "TANA DEL¯DRAGO@"
IcePathName:         db "PASSAGGIO¯SOMMERSO@"
NotApplicableName:   db "N/A@" ; "オバケやしき" ("HAUNTED HOUSE") in Japanese
KobanIslandName:      db "ISOLA¯SPERDUTA@"
IejimaTown:    db "IEJIMA¯TOWN@"
KumeCityName:      db "KUME CITY@"
NagoVillageName:    db "NAGO¯VILLAGE@"
LavenderTownName:    db "LAVANDONIA@"
AmamiTownName:   db "AMAMI TOWN@"
KantoRegionName:     db "KANTO@"
RyukyuCityName:     db "RYUKYU CITY@"
StandCityName:     db "STAND CITY@"
FrostpointTownName:  db "GELOPOLI@"
MountFujiName:   db "MT.FUJI@"
VictoryRoadName:     db "CROWN PATH@"
UrasoeParkName:          db "URASOE PARK@"
CharredSummitName:      db "CHARRED¯SUMMIT@"
ForkedStraitName:   db "FORKED¯STRAIT@"
SilphCoName:         db "SILPH SPA@"
SafariZoneName:      db "ZONA SAFARI@"
NanjoForestName:  db "NANJO¯FOREST@"
PokemonMansionName:  db "#MON¯MANSION@"
NagoCaveName:    db "NAGO¯CAVE@"
TropicalIslandJungleName:          db "PERCORSO 1@"
Route116Name:          db "PERC. 116@"
Route117Name:          db "PERC. 117@"
Route118Name:          db "PERC. 118@"
SunpointDocksName:          db "SUNPOINT¯DOCKS@"
Route119Name:          db "PERC. 119@"
Route120Name:          db "PERC. 120@"
Route114Name:          db "PERC. 114@"
SeasidePathName:         db "RIVA@"
MotobuPathName:         db "MOTOBU¯PATH@"
UrasoeTrailName:         db "URASOE¯TRAIL@"
TatsugoPathName:         db "TATSUGO¯PATH@"
Route121Name:         db "PERC. 121@"
KikaiStraitName:         db "STRETTO¯ARCANO@"
KikaiCalderaName:         db "KIKAI¯CALDERA@"
WeatheredTrailName:         db "WEATHERED¯TRAIL@"
RouteU8UName:         db "PERCORSO 18@"
KeramaStraitName:         db "KERAMA¯STRAIT@"
IsenStraitName:         db "ISEN STRAIT@"
Route107Name:         db "PERC. 107@"
RouteU7UName:         db "PERCORSO 22@"
FujiSummitName:         db "PERCORSO 23@"
KumePointName:         db "KUME POINT@"
MeridianPathName:         db "MERIDIAN¯PATH@"
RouteU6UName:         db "PERCORSO 26@"
Route115Name:         db "PERC. 115@"
RouteU5UName:         db "PERCORSO 28@"
Route101Name:         db "PERC. 101@"
Route105Name:         db "PERC. 105@"
Route106Name:         db "PERC. 106@"
Route112Name:         db "PERC. 112@"
Route104Name:         db "PERC. 104@"
Route113Name:         db "PERC. 113@"
Route103Name:         db "PERC. 103@"
Route102Name:         db "PERC. 102@"
SilentHillsName:         db "PIANE¯SILENTI@"
Route108Name:         db "PERC. 108@"
Route109Name:         db "PERC. 109@"
Route110Name:         db "PERC. 110@"
Route111Name:         db "PERC. 111@"
RouteU4UName:         db "PERCORSO 42@"
BoardwalkName:         db "BOARDWALK@"
UnusedRoute1Name:         db "PERCORSO 44@"
UnusedPathName:         db "PERCORSO 45@"
GreatEastStraitName:         db "GREAT EAST¯STRAIT@"
AmpareCavernName:        db "AMPARE¯CAVERN@"
JadeForestName:      db "BOSCO GIADA@"
MagmaShaftName:     db "MAGMA SHAFT@"
FastShipName:        db "VELOSCAFO@"
ViridianForestName:  db "BOSCO¯SMERALDO@"
IcedCavernName:    db "ICED¯CAVERN@"
RainbowIslandName:      db "IRIDISOLA@"
JouleCaveName:     db "JOULE CAVE@"
BattleTowerName:     db "TORRE¯LOTTA@"
SpecialMapName:      db "SPECIAL@"
