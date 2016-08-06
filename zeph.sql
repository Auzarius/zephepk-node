-- MySQL dump 10.14  Distrib 5.5.42-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: benderi_Zephaniah
-- ------------------------------------------------------
-- Server version	5.5.42-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `AlbumTracks`
--

DROP TABLE IF EXISTS `AlbumTracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AlbumTracks` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `AlbumId` int(10) NOT NULL,
  `TrackNum` int(10) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Length` time NOT NULL,
  `Lyrics` text,
  PRIMARY KEY (`Id`),
  KEY `AlbumId` (`AlbumId`),
  CONSTRAINT `AlbumTracks_ibfk_1` FOREIGN KEY (`AlbumId`) REFERENCES `Albums` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AlbumTracks`
--

LOCK TABLES `AlbumTracks` WRITE;
/*!40000 ALTER TABLE `AlbumTracks` DISABLE KEYS */;
INSERT INTO `AlbumTracks` VALUES (1,1,1,'The Metal Prayer','00:03:59','Oh, Metal Gods\r\nWho art in Valhalla\r\nHallowed be thy names\r\nMany battles done and kingdoms won\r\nTo be able to claim victory\r\n\r\nGive us this day our shields and swords\r\nAnd forgive our lack of mercy\r\nAs we forgive those\r\nwho are merciful towards us\r\nAnd lead us not\r\ninto the land of the peaceful\r\nBut deliver us into battle\r\nFor the power, the glory, the honor are yours\r\nNow and forever\r\n\r\nHail, hail, hail…'),(2,1,2,'Antietam','00:05:39','A devastating assault\r\nCast upon their left flank\r\nConfederates at fault\r\nDispiriting their vast ranks\r\nOn a bridge they rode\r\nStampeding with full power\r\nThe Union army showed\r\nWho stood tall that final hour\r\n\r\nBrother, Brother\r\nShoot each other\r\nFor your country\r\nFor your own life\r\nFather, Mother\r\nHave Another\r\nWe are Dying\r\nStop your crying\r\nThis bloody day\r\n\r\nTheir hearts are still bleeding\r\nBut too much blood is lost\r\nThe dead wind is beating\r\nFrom their own holocaust\r\nReinforcements come\r\nAnd march on the field\r\nBeating on their drums\r\nFor hours they never yield\r\n\r\nBrother, Brother\r\nShoot each other\r\nFor your country\r\nFor your own life\r\nFather, Mother\r\nHave Another\r\nWe are dying\r\nStop your crying\r\nThis bloody day'),(3,1,3,'Avenger of Souls','00:06:34','When you’re the only one\r\nLeft in battle\r\nYou will stand and fight\r\nOr perish like the others\r\n\r\nIf you try to run\r\nThey will catch you\r\nIf you try to hide\r\nThey will surely find you\r\n\r\nThink of what’s become\r\nOf your brothers\r\nAvenge their restless souls\r\nAttack with all your fury\r\n\r\nMeet them in the middle\r\nWith power you can feel\r\nThen it will be settled\r\nWith a mighty clash of steel\r\n\r\nShout out your battle cry\r\nTo deter them\r\nCharge with all your strength\r\nAnd slay them by the hundreds\r\n\r\nBlocking sword with shield\r\nDodging arrows\r\nBodies on the fields\r\nWith the blood of thine enemies\r\n\r\nMeet them in the middle\r\nWith power you can feel\r\nThen it will be settled\r\nWith a mighty clash of steel\r\n\r\nWo!\r\nIt is done\r\nTo avenge the fallen ones\r\nFighting!\r\nAll alone\r\nThey’ll remember you as\r\nAvenger of Souls'),(4,1,4,'Deep Breath','00:05:06','If an hour goes by\r\nAnd time stands still\r\nWhen death birds fly\r\nAnd dark blood spills\r\nIf the way is lost\r\nAnd paths are found\r\nSpears are tossed\r\nMorale is down\r\n\r\nWe will fight on\r\nOur enemies will fall\r\nFight until dawn\r\nWe will not fall\r\n\r\nWhen armor breaks\r\nAnd warriors cry\r\nWhen bodies bake\r\nAnd soldiers die\r\nWhen tigers fight\r\nAnd lions roar\r\nInto the night\r\nThe blood will pour\r\n\r\nWe will fight on\r\nOur enemies will crawl\r\nFight until dawn\r\nWe will not fall\r\n\r\nOur eyes are red\r\nOur fingers sore\r\nOur swords like lead\r\nOur skin is torn\r\nWe cry for aid\r\nIn a time of need\r\nHeads held high\r\nTheir wounds will bleed\r\n\r\nWe will fight on\r\nOur enemies will crawl\r\nFight until dawn\r\nWe will not fall\r\n\r\nWe will not fall\r\nWe will fight on\r\n\r\nThe battle is won\r\nThe war has just begun'),(5,1,5,'Sword of the King','00:07:06','Forged out of mighty steel\r\nSharpened by the grinding wheel\r\nShining with crimson light\r\nIt’s prepared to win the fight\r\nA mighty warrior holds it high\r\nHe is not afraid to die\r\nTheir glory is world renown\r\nThey hold their enemies spellbound\r\n\r\nThey ride into battle\r\nto defend their land\r\nMighty warriors with swords in hand\r\n\r\nOh! Sword of Rubies\r\nIn your sapphire sheath\r\nWon’t you come out to fight\r\nAnd kill our enemies\r\n\r\nRiding on the battlefield\r\nThe sword is cracking every shield\r\nComing to the castle-hold\r\nWhere inside lies the king of old\r\nHis wickedness and tyranny\r\nWill be his undoing indeed\r\nThe evil king will be cast down\r\nThe rightful heir will take the crown\r\n\r\nWe need your power now\r\nwe must win the battle somehow\r\nAnd you will lead us on\r\nto certain victory\r\n\r\nOh! Sword of Rubies\r\nIn your sapphire sheath\r\nWon’t you come out to fight\r\nAnd kill our enemies\r\n\r\nThe rightful heir takes up the crown\r\nAnd he shall rule over all that he sees\r\n\r\nOh! Sword of Rubies\r\nIn your sapphire sheath\r\nWon’t you come out to fight\r\nAnd kill our enemies'),(6,1,6,'Fight for Love','00:05:49','Fight for the energy\r\nFight for the ecstasy\r\nRaise your swords up to thesky\r\nShow the demons how they’ll die\r\nGrab thy horse, unsheathe thy steel\r\nLet love be our battlefield\r\nWe fight for love that’s right and true\r\nOur love will triumph over you\r\n\r\nFight! Fight for love\r\nFight the war\r\nFight for love\r\n\r\nYou will try but not succeed\r\nOvercome by foolish greed\r\nLove burns power over sin\r\nYou will lose we will win\r\nCounting down the enemy list\r\nLightning strikes in love’s fist\r\nLove is power you will see\r\nThe only way to be free\r\n\r\nFight! Fight for love\r\nFight the war\r\nFight for love\r\n\r\nTime has come to march to fight\r\nSword in hand shield held tight\r\nBoth sides face eye to eye\r\nTruth cries to overcome lies\r\nUnder the moon and under the sun\r\nLove’s victory shall be won\r\nWe will fight for loves call\r\nOur love will triumph above all\r\n\r\nFight! Fight for love\r\nFight the war\r\nFight for love\r\n\r\nFight!...'),(7,1,7,'Blackbeard\'s Revenge','00:07:54','The Captain sighs and breathes anew\r\nAs he looks upon the ocean blue\r\nFly to the decks, we must prepare\r\nThe shouts of battle in the air\r\n\r\nThe water rises higher and higher\r\nOur bones break and our muscles tire\r\nThe captain sings like a choir\r\n\"Man the cannons boys, its time to fire!\"\r\n\r\nMan the cannons secure the sails\r\nThis be the day that we prevail\r\nBodies flying, Our lives are lost\r\nDefend the ship at any cost\r\n\r\nThe water rises higher and higher\r\nOur bones break and our muscles tire\r\nThe captain sings like a choir\r\n\"Man the cannon boys, its time to fire!\"\r\n\r\nBows are breaking with bending steel\r\nAs the captain comforts his trembling wheel\r\nThe captain orders the men’s retreat\r\nBut we have never known defeat\r\n\r\nThe bow is broken the decks are smashed\r\nThe ship is taking water fast\r\nWe don’t know how longthe ship will hold\r\nBloodied water around the ship\r\nBodies fallen from the steel’s tip\r\nThe enemy will never take our gold!\r\n\r\nSongs are sung and tales are told\r\nHow we raped their land\r\nand stole their gold\r\nWe are sailing with blood red eyes\r\nFor we are pirates in disguise\r\n\r\nThe water rises higher and higher\r\nOur bones break and our muscles tire\r\nThe captain sings like a choir\r\n\"Man the cannons boys, its time to fire!\"\r\n\r\nFIRE!'),(8,1,8,'The Lone Warrior','00:06:56','From her castle in the sky\r\nThe Ice Queen watches down\r\nAt the warrior down below\r\nRiding into town\r\nHe proclaims his love\r\nAnd she puts on a façade\r\nHer treachery and lies have made him curse the Gods\r\n\r\nHer love is blinding as the snow\r\nAnd he does not know which way to go\r\n\r\nStand and fight against the world\r\nWith only a sword in your hand\r\nYour true power will be unfurled\r\nYou will become a man\r\n\r\nHe rides along the beaten path\r\nSure of loves way\r\nShe breaks her vow\r\nStabs him in the back\r\nMakes the warrior pay\r\nFor his crime of love\r\nHe did not deny\r\nHe took his steel\r\nBroke her flesh\r\nAnd then he said goodbye\r\n\r\nLeaving her to die in his wake\r\nHis honor and his pride he must take\r\n\r\nStand and fight against the world\r\nWith only a sword in your hand\r\nYour true power will be unfurled\r\nYou will become a man\r\n\r\nStand & fight against the world\r\nWith only a sword in your hand\r\nYour true power will be unfurled\r\nYou will become a man'),(9,1,9,'Flame of the Dragon','00:05:05','Fire blazing from its mouth\r\nDark wings in the sky\r\nFeeble soldiers down below\r\nBurning as they die\r\n\r\nHis breath will show no mercy\r\nHis eyes will show no fear\r\nFly the dragon into the night\r\nFeel his fire in the sky\r\nFly the dragon swords held high\r\nBurn them as they die\r\n\r\nHe flies across the clouds\r\nSearching for their death\r\nAnd when he sees his enemies\r\nHe burns them with his breath\r\n\r\nHis breath will show no mercy\r\nHis eyes will show no fear\r\n\r\nFly the dragon into the night\r\nFeel his fire in the sky\r\nFly the dragon swords held high\r\nBurn them as they die\r\n\r\nThose who stand against us\r\nWill only meet with flames\r\nAnd when they beg for mercy\r\nTheir faces will be maimed\r\n\r\nHis breath will show no mercy\r\nHis eyes will show no fear\r\n\r\nFly the dragon into the night\r\nFeel his fire in the sky\r\nFly the dragon swords held high\r\nBurn them as they die'),(10,3,1,'Reforged','00:06:57','A lone warrior holds aloft the sword of rubies\r\nHe holds it high above his head\r\nA lone conspirator plots the swords destruction\r\nTo bring its glory to an end\r\nComing in the night\r\nHidden by shadows\r\nPlaying out his treachery\r\n\r\nBrought together from the ends of the world\r\nBroken pieces of a mighty blade\r\nThe anvil strike sings an awesome chord\r\nWe are reforged\r\n\r\nThe blade lies fractured\r\nNe\'er to be whole again\r\nStrewn about the ground\r\nShards of ruby can\'t be found\r\nSongs and tales were told\r\nOf the famous sword of old\r\nIn a growing time of need\r\nLegends return to reality\r\nForgotten fractals made whole again\r\nComing together\r\nBringing darkness to an end\r\n\r\nFrom the fires in the forge\r\nLike a phoenix reborn\r\nSparks ignite the iron\'s core\r\nBound together through the storm\r\nLightning strikes crashing down\r\nAs we hear a thunderous sound\r\nResurrecting our almighty steel\r\n\r\nComplete once more, the blade of fabled legend is now\r\nStronger than it previously was\r\nUnbeatable and magical, the king\'s sword brought glory\r\nBack to its wielder and all those who bore\r\nWitness to its might and power!!'),(11,3,2,'Destiny','00:03:54','Far across the sky\r\nIn a distant time\r\nPeople fight\r\nFor their lives decline\r\nNo hope to cling to\r\nAll seems lost\r\nThey have to pay the price\r\nNo matter the cost\r\nNowhere to go\r\nThe wasteland is their home\r\n\r\nNo food, no water, no way to survive\r\nAgainst all odds, they keep hope alive\r\n\r\nFight on forever\r\nDon\'t lose your soul\r\nKeep your hands held high\r\nInto our destiny\r\nWe will ride\r\n\r\nA story passed along\r\nFrom the olden days\r\nTells of a place\r\nFree from malice and rage\r\nIn a desperate march\r\nThey cross the barren lands\r\nBut no green was found\r\nOnly death in the sands\r\nOne by one they fall\r\nThe earth reclaims them all\r\n\r\nHaving been deceived\r\nTheir hope was in vain\r\nCarried on the wind\r\nAll their screams of pain'),(12,3,3,'Mad Max','00:07:01','I am the night rider\r\nI\'m a fuel injected suicide machine\r\nI am the rockery, I am the roller\r\nI am the out of controller\r\nDown the road with fire in my eyes\r\nDriving fast and cheating death\r\nFaster, faster, faster, faster\r\nYou can\'t take me alive\r\n\r\nIn a world gone cold\r\nWith hot blood I still roam\r\nBringing justice from the law\r\nNo time to wait\r\nThe wheels of fate\r\nAre rolling towards me\r\nIt\'s driving me mad\r\n\r\nThe knight rider is dead\r\nBrought down by the justice of the law\r\nHis peoples rage, on display\r\nDestroying all they see\r\n\r\nUpon the sea of hot asphalt\r\nWith fury the gang rides\r\nBeating, stealing, raping, death\r\nInto glory ride\r\n\r\nMarked by Toecutter\'s dismay\r\nMy family caught in the fray\r\nIn exchange for the life of their friend\r\nMy wife and child shall pay\r\nTrapped on a desolate road\r\nThe getaway car goes cold\r\nAs I race to the horrifying scene\r\nAll I love is gone in an awful dream\r\n\r\nI\'m mad'),(13,3,4,'Road Warrior','00:07:18','Through the dust clouds and sandstorms I roam\r\nThrough this ravaged world that I call my home\r\nFood and fuel are in short supply\r\nSought by the merciless, those who fight them die\r\n\r\nOnly one upholds the law\r\nLone vigilante hills them all\r\n\r\nIt\'s the end of the world\r\nNothing left but roads\r\nHe who drives the fastest\r\nWon\'t pay death\'s toll\r\nThe highway is my battleground\r\nMy engine is the call\r\nThe warrior of the road\r\nDrives through them all\r\n\r\nThe final outpost with fuel reserves maintained\r\nComes under siege by outlaws unrestrained\r\nBetween life or death, to skirmish or take flight\r\nMailing their choice to flee into the night\r\n\r\nOne man stands between them all\r\nJustice served, they will fall'),(14,3,5,'Thunderdome','00:04:49','Two men enter, one man leaves!!!\r\n\r\nComing from the wasteland\r\nInto barter town\r\nMy supplies, followed here\r\nNowhere to be found\r\nA deal is struck with the witch\r\nWho will decide my fate\r\nBlood & sweat in the ring\r\nBoth run down my face\r\n\r\nFight to the death\r\nWith all your strength\r\nFight to the death\r\nWith all your might\r\nFight to the death\r\nYou have to win\r\nFight to the death\r\nOr it\'s your life\r\n\r\nMaster Blaster, behind the scenes\r\nControlling all the gas\r\nEqual parts, strong and smart\r\nA giant killing mass\r\nIn the ring, a dome of spikes\r\nWeapons all around\r\nFlying high above my foe\r\nI must strike him down\r\n\r\nTwo men enter, one man leaves!!!'),(15,3,6,'Quest for the Royal Crown','00:09:16','Riding across a desert plain\r\nSearching for new land to gain\r\nAn oasis of water lies just ahead\r\nGuarded by men to be slain\r\nCarrying our weapons, grasping our shields\r\nNone who are weak shall remain\r\nRiding up swiftly killing them all\r\nMaking them feel fear and pain\r\n\r\nCrushing, beating, destroying their homes\r\nA sacrifice is made in vain\r\nNo one survives to carry on\r\nLeaving no trace of their name\r\n\r\nFive valiant warriors ride from the north\r\nTraversing across the sand\r\nMaking a claim for the oasis hold\r\nVictory is close at hand\r\nAn enemy escapes with the king\'s royal crown\r\nThe water becomes naught but sand\r\nWe must ride forth to save our new home\r\nAnd all of those left in our lands\r\n\r\nSearching, hunting, chasing him down\r\nTo restore the peace to our lands\r\nSlicing, tearing, breaking his bones\r\nThe villain will die in the sands\r\n\r\nLosing the trail and losing our way\r\nFeeling like all hope is lost\r\nThe enemy is spotted, dead in our sights\r\nWe must stop him at any cost\r\nRiding up swiftly, taking him down\r\nTearing him limb from limb\r\nScaring his flesh, breaking his bones\r\nAll that is heard are his screams\r\n\r\nTaking the crown that\'s rightfully ours\r\nReturning it back to its home\r\nCarrying it across the desert sands\r\nIn a casing made of his bones\r\n\r\nAs we enter the gates of our kingdom of sand\r\nThe cheers could be heard far and wide\r\nThe crown returned, back to its home\r\nRain clouds soon fill the sky\r\nNourishing waters fall down to earth\r\nGiving new life to our tribe\r\nSongs and tales will forever be told\r\nLong live the five\r\n\r\nNow that their quest has come to an end\r\nIn peace they live their lives\r\nBut not a soul shall ever forget\r\nThe deeds of the warriors five\r\n\r\nThe quest for the royal crown'),(16,3,7,'Judgement','00:06:33','You will see the day when your strength fails you\r\nA day when man and beast will perish\r\nYou will try to run but I will pursue\r\nTaking from you all you cherish\r\n\r\nDo not pray to save your souls\r\nWhen the hour of judgement tolls\r\n\r\nI offered pain or salvation\r\nLaid a path to Valhalla\'s gate\r\nYou chose to face extermination\r\nYou will die on this judgement day\r\n\r\nYou will bear witness to the devastation\r\nBlack clouds dark skies doom and gloom\r\nYour warriors will cry out in trepidation\r\nLike wretched babies ripped from their wombs'),(17,3,8,'Battle Hymn of the Victorious','00:06:49','Brothers come forth and have a drink with me\r\nOn the morrow we fight, death or victory\r\nJoin the fire, share in the glory, grab an ale\r\nRaise up your mugs, join the chant of our epic tale\r\n\r\nInto battle we shall ride\r\nWith mace and chain held high\r\nBut first we steal the night\r\nAnd raise our pints\r\nWe sing triumphantly\r\nAncient tales of bravery\r\nOur horns now filled with mead\r\nWe face our destiny\r\n\r\nAs warriors we toast and drink our fill\r\nGrab the first wench you see and make her squeal\r\nThe band plays on, feasting all through the night\r\nRaise up your fist. Let out your battle cry\r\nPrepare to fight\r\n\r\nInto battle we shall ride\r\nWith mace and chain held high\r\nBut first we steal the night\r\nAnd raise our pints'),(18,2,9,'Blackbeard\'s Revenge (2015)','00:07:40','The captain sighs and breathes anew\r\nAs he looks upon the ocean blue\r\nFly to the decks, we must prepare\r\nThe shouts of battle in the air\r\n\r\nThe water rises higher and higher\r\nOur bones break and our muscles tire\r\nThe captain sings like a choir\r\n\"Man the cannons boys, it\'s time to fire!\"\r\n\r\nMan the cannons secure the sails\r\nThis be the day that we prevail\r\nBodies flying, our lives are lost\r\nDefend the ship at any cost\r\n\r\nThe water rises higher and higher\r\nOur bones break and our muscles tire\r\nThe captain sings like a choir\r\n\"Man the cannon boys, it\'s time to fire!\"\r\n\r\nBoughs are breaking with bending steel\r\nAs the captain comforts his trembling wheel\r\nThe captain orders his men retreat\r\nBut we have never known defeat\r\n\r\nThe bow is broken the decks are smashed\r\nThe ship is taking water fast\r\nWe don’t know how long the ship will hold\r\nBloody water around the ship\r\nBodies falling from the steels tip\r\nThe enemy will never take our gold!\r\n\r\nSongs are sung and tales are told\r\nHow we raped their land and stole their gold\r\nWe are sailing with blood red eyes\r\nFor we are pirates in disguise\r\n\r\nThe water rises higher and higher\r\nOur bones break and our muscles tire\r\nThe captain sings like a choir\r\n\"Man the cannons boys, it\'s time to fire!\"'),(19,2,10,'Deep Breath (2015)','00:05:01','If an hour goes by and time stands still\r\nWhen death birds fly and dark blood spills\r\nIf the way is lost and paths are found\r\nSpears are tossed, morale is down\r\n\r\nWe will fight on\r\nOur enemy will crawl\r\nFight until dawn\r\nWe will not fall\r\n\r\nWhen armor breaks and warriors cry\r\nWhen bodies bake and soldiers die\r\nWhen tigers fight and lions roar\r\nInto the night the blood will pour\r\n\r\nWe will fight on\r\nOur enemies will crawl\r\nFight until dawn\r\nWe will not fall\r\n\r\nOur eyes are red, our fingers sore\r\nOur swords like lead, our skin is torn\r\nWe cry for aid, in a time of need\r\nHeads held high, their wounds will bleed\r\n\r\nWe will fight on\r\nOur enemies will crawl\r\nFight until dawn\r\nWe will not fall\r\n\r\nWe will not fall\r\nWe will fight on\r\n\r\nThe battle is won\r\nThe war has just begun');
/*!40000 ALTER TABLE `AlbumTracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Albums`
--

DROP TABLE IF EXISTS `Albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Albums` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `NumTracks` int(10) NOT NULL,
  `ReleaseDate` date NOT NULL,
  `Label` varchar(100) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Albums`
--

LOCK TABLES `Albums` WRITE;
/*!40000 ALTER TABLE `Albums` DISABLE KEYS */;
INSERT INTO `Albums` VALUES (1,'Stories from the Book of Metal',9,'2007-03-31','Self-Released'),(2,'Reforged (Japanese Release)',10,'2015-12-19','Spiritual Beast Records'),(3,'Reforged',8,'2016-02-12','Divebomb Records');
/*!40000 ALTER TABLE `Albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MerchItems`
--

DROP TABLE IF EXISTS `MerchItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MerchItems` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `TypeId` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `MSRP` decimal(4,2) DEFAULT NULL,
  `Soldout` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `TypeId` (`TypeId`),
  CONSTRAINT `MerchItems_ibfk_1` FOREIGN KEY (`TypeId`) REFERENCES `MerchTypes` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MerchItems`
--

LOCK TABLES `MerchItems` WRITE;
/*!40000 ALTER TABLE `MerchItems` DISABLE KEYS */;
INSERT INTO `MerchItems` VALUES (1,1,'B/W Logo',12.00,NULL),(2,1,'Color Logo',15.00,1),(3,1,'Viking',20.00,NULL),(4,1,'Nic Cage',20.00,NULL),(5,2,'Stories from the Book of Metal',10.00,1),(6,2,'Reforged',12.00,NULL),(7,3,'Reforged Poster',1.00,NULL),(8,4,'Logo Sticker',1.00,NULL),(9,5,'Small Patch',5.00,NULL),(10,6,'Pint Glass',7.00,NULL),(11,6,'Shot Glass',5.00,NULL);
/*!40000 ALTER TABLE `MerchItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MerchSales`
--

DROP TABLE IF EXISTS `MerchSales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MerchSales` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `ShowId` int(10) DEFAULT NULL,
  `ItemId` int(10) NOT NULL,
  `SalePrice` decimal(5,2) NOT NULL,
  `Quantity` int(10) NOT NULL,
  `OnlineSaleDate` date DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ItemId` (`ItemId`),
  KEY `MerchSales_ibfk_1` (`ShowId`),
  CONSTRAINT `MerchSales_ibfk_1` FOREIGN KEY (`ShowId`) REFERENCES `TourDates` (`Id`),
  CONSTRAINT `MerchSales_ibfk_2` FOREIGN KEY (`ItemId`) REFERENCES `MerchItems` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=296 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MerchSales`
--

LOCK TABLES `MerchSales` WRITE;
/*!40000 ALTER TABLE `MerchSales` DISABLE KEYS */;
INSERT INTO `MerchSales` VALUES (1,1,5,10.00,16,NULL),(2,1,8,1.00,7,NULL),(3,1,7,1.00,6,NULL),(4,1,9,1.00,1,NULL),(5,1,1,12.00,3,NULL),(6,1,2,15.00,2,NULL),(7,1,3,20.00,5,NULL),(8,1,10,7.00,1,NULL),(9,1,11,5.00,1,NULL),(10,2,5,10.00,5,NULL),(11,2,8,1.00,6,NULL),(12,2,1,12.00,1,NULL),(13,2,3,20.00,2,NULL),(14,3,5,10.00,2,NULL),(15,3,8,1.00,3,NULL),(16,3,9,1.00,2,NULL),(17,3,1,12.00,4,NULL),(18,3,2,15.00,3,NULL),(19,3,3,20.00,4,NULL),(20,3,10,7.00,1,NULL),(21,4,5,10.00,4,NULL),(22,4,7,1.00,1,NULL),(23,4,1,12.00,2,NULL),(24,4,2,15.00,1,NULL),(25,4,3,20.00,3,NULL),(26,5,5,10.00,1,NULL),(27,5,1,12.00,1,NULL),(28,5,3,20.00,2,NULL),(29,6,5,10.00,1,NULL),(30,6,8,1.00,1,NULL),(31,6,9,1.00,2,NULL),(32,6,1,12.00,2,NULL),(33,6,2,15.00,2,NULL),(34,6,3,20.00,3,NULL),(35,7,5,10.00,4,NULL),(36,7,8,1.00,2,NULL),(37,7,9,1.00,1,NULL),(38,7,1,12.00,3,NULL),(39,7,2,15.00,2,NULL),(40,7,3,20.00,3,NULL),(41,7,10,7.00,1,NULL),(42,8,5,10.00,3,NULL),(43,8,8,1.00,4,NULL),(44,8,3,20.00,2,NULL),(45,9,5,10.00,1,NULL),(46,9,8,1.00,1,NULL),(47,9,9,1.00,8,NULL),(48,9,1,12.00,5,NULL),(49,9,2,15.00,3,NULL),(50,9,3,20.00,5,NULL),(51,9,10,7.00,1,NULL),(52,9,11,5.00,1,NULL),(53,10,5,10.00,1,NULL),(54,10,9,1.00,1,NULL),(55,10,1,12.00,1,NULL),(56,10,3,20.00,1,NULL),(57,11,5,10.00,3,NULL),(58,11,1,12.00,1,NULL),(59,11,3,20.00,1,NULL),(60,12,5,10.00,3,NULL),(61,12,8,1.00,4,NULL),(62,12,9,1.00,1,NULL),(63,12,1,12.00,1,NULL),(64,12,2,15.00,1,NULL),(65,12,3,20.00,2,NULL),(66,13,5,10.00,3,NULL),(67,13,8,1.00,4,NULL),(68,13,7,1.00,1,NULL),(69,13,1,12.00,3,NULL),(70,13,2,15.00,1,NULL),(71,13,3,20.00,2,NULL),(72,14,5,10.00,1,NULL),(73,14,8,1.00,1,NULL),(74,14,3,20.00,1,NULL),(75,15,5,10.00,4,NULL),(76,15,8,1.00,2,NULL),(77,15,7,1.00,3,NULL),(78,15,1,12.00,1,NULL),(79,15,3,20.00,2,NULL),(80,16,5,10.00,4,NULL),(81,16,8,1.00,2,NULL),(82,16,7,1.00,4,NULL),(83,16,9,1.00,2,NULL),(84,16,1,12.00,1,NULL),(85,16,3,20.00,1,NULL),(86,17,5,10.00,4,NULL),(87,17,9,1.00,1,NULL),(88,17,1,12.00,1,NULL),(89,17,2,15.00,1,NULL),(90,17,3,20.00,1,NULL),(91,18,5,10.00,4,NULL),(92,18,8,1.00,4,NULL),(93,18,9,1.00,2,NULL),(94,18,1,12.00,2,NULL),(95,18,2,15.00,1,NULL),(96,18,3,20.00,3,NULL),(97,18,10,7.00,1,NULL),(98,19,1,12.00,1,NULL),(99,19,3,20.00,2,NULL),(100,20,5,10.00,2,NULL),(101,20,8,1.00,6,NULL),(102,20,1,12.00,1,NULL),(103,20,3,20.00,1,NULL),(104,21,5,10.00,5,NULL),(105,21,7,1.00,2,NULL),(106,21,1,12.00,1,NULL),(107,21,3,20.00,2,NULL),(108,22,5,10.00,2,NULL),(109,22,1,12.00,1,NULL),(110,22,2,15.00,1,NULL),(111,22,3,20.00,1,NULL),(112,23,5,10.00,2,NULL),(113,23,8,1.00,5,NULL),(114,23,7,1.00,4,NULL),(115,23,9,1.00,2,NULL),(116,23,1,12.00,2,NULL),(117,23,2,15.00,2,NULL),(118,23,3,20.00,4,NULL),(119,23,10,7.00,1,NULL),(120,23,11,5.00,1,NULL),(121,24,5,10.00,10,NULL),(122,24,8,1.00,7,NULL),(123,24,7,1.00,6,NULL),(124,24,9,1.00,5,NULL),(125,24,1,12.00,3,NULL),(126,24,2,15.00,3,NULL),(127,24,3,20.00,4,NULL),(128,24,10,7.00,1,NULL),(129,24,11,5.00,1,NULL),(130,25,5,10.00,2,NULL),(131,25,8,1.00,3,NULL),(132,25,7,1.00,3,NULL),(133,25,1,12.00,1,NULL),(134,25,2,15.00,2,NULL),(135,25,3,20.00,2,NULL),(136,26,5,10.00,2,NULL),(137,26,8,1.00,1,NULL),(138,26,9,1.00,1,NULL),(139,26,1,12.00,1,NULL),(140,26,2,15.00,1,NULL),(141,26,3,20.00,2,NULL),(142,27,5,10.00,3,NULL),(143,27,1,12.00,2,NULL),(144,27,2,15.00,1,NULL),(145,27,3,20.00,2,NULL),(146,28,5,10.00,1,NULL),(147,28,8,1.00,1,NULL),(148,28,1,12.00,2,NULL),(149,28,2,15.00,2,NULL),(150,28,3,20.00,3,NULL),(151,29,5,10.00,2,NULL),(152,29,8,1.00,2,NULL),(153,29,7,1.00,2,NULL),(154,29,9,1.00,4,NULL),(155,29,1,12.00,1,NULL),(156,29,3,20.00,2,NULL),(157,30,5,10.00,5,NULL),(158,30,9,1.00,2,NULL),(159,30,1,12.00,3,NULL),(160,30,2,15.00,3,NULL),(161,30,3,20.00,3,NULL),(162,30,10,7.00,1,NULL),(163,31,5,10.00,3,NULL),(164,31,8,1.00,5,NULL),(165,31,9,1.00,2,NULL),(166,31,1,12.00,1,NULL),(167,31,2,15.00,2,NULL),(168,31,3,20.00,2,NULL),(169,31,10,7.00,1,NULL),(170,32,5,10.00,2,NULL),(171,32,8,1.00,6,NULL),(172,32,7,1.00,2,NULL),(173,32,1,12.00,1,NULL),(174,32,2,15.00,1,NULL),(175,32,3,20.00,1,NULL),(176,33,5,10.00,7,NULL),(177,33,8,1.00,2,NULL),(178,33,7,1.00,1,NULL),(179,33,1,12.00,2,NULL),(180,33,2,15.00,2,NULL),(181,33,3,20.00,3,NULL),(182,33,10,7.00,1,NULL),(183,34,7,1.00,1,NULL),(184,34,1,12.00,1,NULL),(185,34,2,15.00,1,NULL),(186,35,5,10.00,1,NULL),(187,35,2,15.00,1,NULL),(188,35,3,20.00,1,NULL),(189,36,5,10.00,2,NULL),(190,36,8,1.00,2,NULL),(191,36,7,1.00,1,NULL),(192,36,1,12.00,3,NULL),(193,36,2,15.00,2,NULL),(194,36,3,20.00,2,NULL),(195,37,5,10.00,3,NULL),(196,37,8,1.00,3,NULL),(197,37,1,12.00,1,NULL),(198,37,2,15.00,1,NULL),(199,37,3,20.00,1,NULL),(200,38,8,1.00,6,NULL),(201,38,9,1.00,2,NULL),(202,38,1,12.00,1,NULL),(203,38,2,15.00,1,NULL),(204,39,3,20.00,1,NULL),(205,40,5,10.00,3,NULL),(206,40,8,1.00,2,NULL),(207,40,1,12.00,1,NULL),(208,40,2,15.00,1,NULL),(209,40,3,20.00,2,NULL),(210,41,1,12.00,1,NULL),(211,41,3,20.00,1,NULL),(212,42,5,10.00,5,NULL),(213,42,8,1.00,3,NULL),(214,42,9,1.00,2,NULL),(215,42,1,12.00,1,NULL),(216,42,2,15.00,1,NULL),(217,42,3,20.00,2,NULL),(218,43,5,10.00,7,NULL),(219,43,8,1.00,4,NULL),(220,43,9,1.00,3,NULL),(221,43,1,12.00,2,NULL),(222,43,2,15.00,2,NULL),(223,43,3,20.00,3,NULL),(224,43,10,7.00,1,NULL),(225,44,8,1.00,2,NULL),(226,44,7,1.00,1,NULL),(227,44,9,1.00,2,NULL),(228,44,6,1.00,16,NULL),(229,44,1,12.00,2,NULL),(230,44,2,15.00,1,NULL),(231,44,3,20.00,2,NULL),(232,44,10,7.00,1,NULL),(233,44,11,5.00,1,NULL),(234,45,5,10.00,2,NULL),(235,45,8,1.00,2,NULL),(236,45,7,1.00,1,NULL),(237,45,6,1.00,4,NULL),(238,45,1,12.00,2,NULL),(239,45,2,15.00,1,NULL),(240,45,3,20.00,2,NULL),(241,45,4,20.00,2,NULL),(242,45,10,7.00,1,NULL),(243,46,8,1.00,10,NULL),(244,46,7,1.00,2,NULL),(245,46,9,1.00,2,NULL),(246,46,6,1.00,21,NULL),(247,46,1,12.00,2,NULL),(248,46,2,15.00,2,NULL),(249,46,3,20.00,1,NULL),(250,46,4,20.00,3,NULL),(251,46,10,7.00,1,NULL),(252,46,11,5.00,1,NULL),(253,47,8,1.00,1,NULL),(254,47,9,1.00,1,NULL),(255,47,6,1.00,10,NULL),(256,47,1,12.00,1,NULL),(257,47,3,20.00,2,NULL),(258,47,4,20.00,4,NULL),(259,47,10,7.00,1,NULL),(260,48,5,10.00,1,NULL),(261,48,7,1.00,1,NULL),(262,48,9,1.00,4,NULL),(263,48,6,1.00,11,NULL),(264,48,1,12.00,2,NULL),(265,48,3,20.00,3,NULL),(266,48,4,20.00,3,NULL),(267,48,10,7.00,1,NULL),(268,48,11,5.00,1,NULL),(269,49,8,1.00,5,NULL),(270,49,7,1.00,2,NULL),(271,49,6,1.00,5,NULL),(272,49,1,12.00,3,NULL),(273,49,3,20.00,2,NULL),(274,49,4,20.00,1,NULL),(275,49,10,7.00,1,NULL),(276,51,5,10.00,1,NULL),(277,51,8,1.00,2,NULL),(278,51,1,12.00,1,NULL),(279,51,4,20.00,2,NULL),(280,52,8,1.00,4,NULL),(281,52,7,1.00,1,NULL),(282,52,9,1.00,1,NULL),(283,52,6,1.00,2,NULL),(284,52,1,12.00,1,NULL),(285,52,4,20.00,3,NULL),(286,53,8,1.00,3,NULL),(287,53,7,1.00,3,NULL),(288,53,9,1.00,3,NULL),(289,53,6,1.00,2,NULL),(290,53,1,12.00,1,NULL),(291,53,3,20.00,2,NULL),(292,53,4,20.00,3,NULL),(293,53,10,7.00,1,NULL);
/*!40000 ALTER TABLE `MerchSales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MerchTypes`
--

DROP TABLE IF EXISTS `MerchTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MerchTypes` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MerchTypes`
--

LOCK TABLES `MerchTypes` WRITE;
/*!40000 ALTER TABLE `MerchTypes` DISABLE KEYS */;
INSERT INTO `MerchTypes` VALUES (1,'Shirt'),(2,'CD'),(3,'Poster'),(4,'Sticker'),(5,'Patch'),(6,'Glassware');
/*!40000 ALTER TABLE `MerchTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TourDates`
--

DROP TABLE IF EXISTS `TourDates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TourDates` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ShowDate` date NOT NULL,
  `City` varchar(50) NOT NULL,
  `Venue` varchar(50) DEFAULT NULL,
  `Attendance` int(11) DEFAULT NULL,
  `State` char(2) NOT NULL,
  `Bands` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TourDates`
--

LOCK TABLES `TourDates` WRITE;
/*!40000 ALTER TABLE `TourDates` DISABLE KEYS */;
INSERT INTO `TourDates` VALUES (1,'2014-06-27','Columbus','Warriors of Metal Festival ',128,'OH','Aska|James Rivera|Valhalla'),(2,'2014-07-27','Shelbyville','Shelbyville Music Festival',98,'IN',''),(3,'2014-08-29','Grand Rapids','Mulligans',48,'MI','Without Blood'),(4,'2014-08-30','Madison','Dragonfly Lounge',62,'WI','Lords of The Trident|Government Zero'),(5,'2014-08-31','Chicago','Livewire Lounge',25,'IL','Acracy'),(6,'2014-09-19','Lafayette','Doom Room',53,'IN','Turboner|Car Door Dick Smash'),(7,'2014-09-20','Kansas City','Davey\'s Uptown',27,'MO','Alsatia'),(8,'2014-09-21','Indianapolis','5th Quarter',29,'IN',''),(9,'2014-11-01','Fort Wayne','O\'Sullivans',111,'IN','Exterminate All Rational Thought|Masochist'),(10,'2014-11-03','Albany','Bogies',6,'NY','Panzram518|Bloodwar'),(11,'2014-11-04','Worcester','Hotel Vernon',14,'MA','Sonic pulse|Bloodwar'),(12,'2014-11-05','Queens','Blackthorn 51',23,'NY',''),(13,'2014-11-06','Clifton','Dingbatz',6,'NJ',''),(14,'2014-11-07','New Brunswick','House Show',72,'NJ',''),(15,'2014-11-09','Columbus','Shrunken Head',46,'OH','Raven|Night Demon'),(16,'2014-12-06','Fort Wayne','4-Ds Bar',122,'IN','Michael Angelo Batio'),(17,'2014-12-12','Defiance','Spanky\'s',88,'OH','Black Order|Nova Noire|Split Second|Dethrats'),(18,'2014-12-13','Covington','Backstage',35,'KY','Luther|Stonecutters'),(19,'2015-01-16','Fort Wayne','CS3',58,'IN','Lords of the Trident|Demonwolf|Lurking Corpses'),(20,'2015-02-21','Louisville','Third Street Dive',22,'KY','Jereactors|Hot Prowlers'),(21,'2015-02-27','Bowling Green','Howards',82,'OH','Monstrasadus|Catherine\'s X'),(22,'2015-03-14','Fort Wayne,','Skeletune\'s Lounge',88,'N','Stonecutters|Karkosa|Coffinwitch'),(23,'2015-03-20','Lafayette','Doom Room',42,'IN','Photian Schism|Antica Arcana'),(24,'2015-03-21','Covington','Backstage',98,'KY','Automaton|Scarangella|Stagecoach Inferno'),(25,'2015-05-22','Kalamazoo','Shakespeares',26,'MI','Damascus|Blackgate'),(26,'2015-06-06','Fort Wayne','Brass Rail',72,'IN','Wrath|Split The Abyss|Demonwolf'),(27,'2015-06-12','Madison','The Annex',74,'WI','Droids Attack|Lords of the Trident'),(28,'2015-06-13','Appleton','Cold Shot',54,'WI','Forcefield|Lords of The Trident'),(29,'2015-06-20','Indianapolis','5th Quarter',89,'IN','Photian Schism|Faithxtractor|Lucifist'),(30,'2015-07-24','Fort Wayne','C2G Music Hall',92,'IN','Michael Angelo Batio|Exterminate All Rational Thought'),(31,'2015-08-06','Covington','Backstage',54,'KY','Automaton|Split The Abyss|Cain'),(32,'2015-08-07','Johnson City','Hideaway',38,'TN','Cemetery Filth|Suppressive Fire|Graverat'),(33,'2015-08-08','Marietta','Heavy Metal Homecoming - 120 Tavern',152,'GA','Colossus|Zruda|Tortus|Project Roenwolfe'),(34,'2015-08-09','Louisville','Highland Taproom',43,'KY','Stagecoach Inferno|Kingslayer'),(35,'2015-08-21','Fort Wayne','Skeletune\'s Lounge',53,'IN','Automaton|AxeRipper|Masochist'),(36,'2015-09-18','Bowling Green','Howards',50,'OH','Flatline Revival|On Top|Vibrant Troubadors'),(37,'2015-09-20','Fort Wayne','CS3',52,'IN','Impaler|Lurking Corpses|Fiend'),(38,'2015-09-25','Fort Wayne','Skeletune\'s Lounge',40,'IN','Kingslayer|Trampled Under Tyrants'),(39,'2015-10-10','Fort Wayne','Skeletune\'s Lounge',46,'IN','Crimson Shadows|Unleash The Archers|Black Order'),(40,'2015-10-15','Fort Wayne','Piere\'s',257,'IN','Butcher Babies|Nekrogoblikon|Demonwolf'),(41,'2015-10-24','Lafayette','Doom Room',121,'IN','Beast In the Field|Mound Builders'),(42,'2015-12-11','Hammond','5th Ammendment',45,'IN','Axxios|Steel Aggressor'),(43,'2015-12-19','Indianaolis','5th Quarter',52,'IN','Catalytic|El Rusho|Steel Aggressor'),(44,'2016-01-23','Covington','Cincy Power Fest - Madison Theater',298,'KY','Automaton|Siegelord|Lords of The Trident|Solar Flare'),(45,'2016-03-18','Kalamazoo','Shakespeares',75,'MI','Damascus|Arakkis|Tomb of Teeth'),(46,'2016-03-19','Fort Wayne','Skeletune\'s Lounge',89,'IN','Three Cities|Beneath It All'),(47,'2016-03-26','Lafayette','Lafayette Theater',154,'IN','Yesterday\'s Chips|Bizarre Noir'),(48,'2016-04-01','Indianapolis','Headquarters',223,'IN','Grim Reaper|Savage Master'),(49,'2016-04-02','Knoxville','Concourse at the International',56,'TN','Theories of the Apocalypse|Kingslayer|WarClown'),(50,'2016-05-03','Indianapolis','5th Quarter',83,'IN','Stonecutters|Entombed|Exmortus'),(51,'2016-06-02','Chicago','Reggie\'s Rock Club',53,'IL','Colossus|Genotype|Acracy'),(52,'2016-06-03','Fort Wayne','Skeletune\'s Lounge',72,'IN','Wrath|Arterial Mist|Karkosa'),(53,'2016-06-04','Covington','Backstage',65,'KY','Automaton|Colossus|Fenrir'),(54,'2016-06-10','Defiance','Spanky\'s',0,'OH','Dethrats|Nova Noire|Flat tire Ambulance');
/*!40000 ALTER TABLE `TourDates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `v_Merchandise`
--

DROP TABLE IF EXISTS `v_Merchandise`;
/*!50001 DROP VIEW IF EXISTS `v_Merchandise`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_Merchandise` (
  `Type` tinyint NOT NULL,
  `Item` tinyint NOT NULL,
  `MSRP` tinyint NOT NULL,
  `Soldout` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_Sales`
--

DROP TABLE IF EXISTS `v_Sales`;
/*!50001 DROP VIEW IF EXISTS `v_Sales`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_Sales` (
  `SaleDate` tinyint NOT NULL,
  `City` tinyint NOT NULL,
  `Venue` tinyint NOT NULL,
  `Name` tinyint NOT NULL,
  `SalePrice` tinyint NOT NULL,
  `Quantity` tinyint NOT NULL,
  `TotalSales` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_Merchandise`
--

/*!50001 DROP TABLE IF EXISTS `v_Merchandise`*/;
/*!50001 DROP VIEW IF EXISTS `v_Merchandise`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`benderi`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_Merchandise` AS select `t`.`Name` AS `Type`,`i`.`Name` AS `Item`,`i`.`MSRP` AS `MSRP`,`i`.`Soldout` AS `Soldout` from (`MerchItems` `i` left join `MerchTypes` `t` on((`i`.`TypeId` = `t`.`Id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_Sales`
--

/*!50001 DROP TABLE IF EXISTS `v_Sales`*/;
/*!50001 DROP VIEW IF EXISTS `v_Sales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`benderi`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_Sales` AS select (case when isnull(`td`.`ShowDate`) then `ms`.`OnlineSaleDate` else `td`.`ShowDate` end) AS `SaleDate`,`td`.`City` AS `City`,`td`.`Venue` AS `Venue`,`mi`.`Name` AS `Name`,`ms`.`SalePrice` AS `SalePrice`,`ms`.`Quantity` AS `Quantity`,(`ms`.`SalePrice` * `ms`.`Quantity`) AS `TotalSales` from ((`MerchSales` `ms` left join `MerchItems` `mi` on((`ms`.`ItemId` = `mi`.`Id`))) left join `TourDates` `td` on((`ms`.`ShowId` = `td`.`Id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-30 12:06:30
