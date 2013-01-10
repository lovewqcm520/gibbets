package 
{
    import Main.*;
    import States.*;
    import States.GrifShooting.*;
    import States.PlayState.*;
    import flash.net.*;

    public class GameData extends Object
    {
        public static const totalLevelsCount:int = 53;
        public static const SCREEN_25_48:String = "screen_25_48";
        public static const SCREEN_1_24:String = "screen_1_24";
        public static const SCREEN_49_54:String = "screen_49_54";
        private static var m_lastPlayedLevelNum:int = -1;
        private static var m_curSelectLevelScreen:String = null;
        private static var m_grifsCount:int = 0;
        public static var m_isKongregate:Boolean = false;
        private static var m_achievements:Array = new Array();
        private static var m_killedCount:int = 0;
        private static var m_levelsInRaw:int = 0;
        private static var m_scorePerLevel:Array = new Array();
        public static var m_isBloodDisabled:Boolean = false;
        private static var m_levelsCompleted:int = 0;
        private static var m_noInjureInRaw:int = 0;
        private static var m_oldAchiemeventCount:int;
        public static var m_invertedControl:Boolean = false;
        private static var m_levelsWithStar:Array = new Array();
        private static var m_savedCount:int = 0;
        public static var kongregate:Object;
        private static var m_haveAds:Boolean = true;
        public static var m_isHintsOn:Boolean = true;
        private static var m_alreadyPlayed:Array = new Array();

        public function GameData()
        {
            return;
        }// end function

        public static function onStartLevel(param1:int) : void
        {
            m_alreadyPlayed[param1] = true;
            m_oldAchiemeventCount = m_achievements.length;
            return;
        }// end function

        public static function onWinLevel(param1:int, param2:int, param3:Boolean, param4:int) : void
        {
            if (param1 - m_lastPlayedLevelNum == 1 || param1 - m_lastPlayedLevelNum == 2)
            {
                if (param3)
                {
                    var _loc_8:* = m_noInjureInRaw + 1;
                    m_noInjureInRaw = _loc_8;
                }
                else
                {
                    m_noInjureInRaw = 0;
                }
                if (m_noInjureInRaw >= 5)
                {
                    giveAchievement(Achievements.LEVELS_WITHOUT_INJURE);
                }
                var _loc_8:* = m_levelsInRaw + 1;
                m_levelsInRaw = _loc_8;
                if (m_levelsInRaw >= 10)
                {
                    giveAchievement(Achievements.LEVELS_WITHOUT_LOSE);
                }
            }
            else if (param1 != m_lastPlayedLevelNum)
            {
                m_levelsInRaw = 0;
                m_noInjureInRaw = 0;
            }
            m_savedCount = m_savedCount + param4;
            if (m_savedCount >= 50)
            {
                giveAchievement(Achievements.SAVES_50);
            }
            if (m_savedCount >= 100)
            {
                giveAchievement(Achievements.SAVES_100);
            }
            if (StateManager.getInstance().getSeconds() >= 60 * 60)
            {
                giveAchievement(Achievements.HOUR_PLAYED);
            }
            if (StateManager.getInstance().getSeconds() >= 60 * 60 * 2)
            {
                giveAchievement(Achievements.TWO_HOURS_PLAYED);
            }
            if (param1 == m_levelsCompleted)
            {
                var _loc_8:* = m_levelsCompleted + 1;
                m_levelsCompleted = _loc_8;
                if (m_levelsCompleted == 24)
                {
                    giveAchievement(Achievements.HALF_COMPLETED);
                    onEnterSelectLevelScreen(SCREEN_25_48);
                }
                if (m_levelsCompleted == 48)
                {
                    giveAchievement(Achievements.FULL_COMPLETED);
                    onEnterSelectLevelScreen(SCREEN_49_54);
                }
            }
            var _loc_5:int = 0;
            var _loc_6:int = 0;
            while (_loc_6 < m_levelsCompleted)
            {
                
                if (isLevelWithStar(_loc_6))
                {
                    _loc_5++;
                }
                _loc_6++;
            }
            if (_loc_5 >= 40)
            {
                giveAchievement(Achievements.WITH_STAR_40);
            }
            m_scorePerLevel[param1] = Math.max(m_scorePerLevel[param1], param2);
            if (param3)
            {
                m_levelsWithStar[param1] = true;
            }
            save();
            m_lastPlayedLevelNum = param1;
            submitKongregateLevel();
            submitKongregateScore();
            return;
        }// end function

        public static function init() : void
        {
            var _loc_1:int = 0;
            while (_loc_1 < totalLevelsCount)
            {
                
                m_alreadyPlayed.push(false);
                _loc_1++;
            }
            return;
        }// end function

        public static function hideAds() : void
        {
            m_haveAds = false;
            return;
        }// end function

        public static function setHideTips(param1:Boolean) : void
        {
            if (param1)
            {
                hideTips();
            }
            else
            {
                showTips();
            }
            return;
        }// end function

        public static function hideTips() : void
        {
            m_isHintsOn = false;
            save();
            return;
        }// end function

        public static function get levelsCompleted() : int
        {
            return m_levelsCompleted;
        }// end function

        public static function getArrowsLeft(param1:int) : int
        {
            var _loc_2:Array = [30, 30, 1, 4, 9, 1000, 14, 10, 12, 6, 20, 99, 8, 4, 2, 7, 5, 1000, 5, 5, 3, 20, 12, 99, 15, 3, 11, 2, 7, 1000, 14, 15, 4, 10, 15, 99, 3, 10, 4, 1, 10, 1000, 5, 5, 14, 1, 1, 99, 20, 18, 3, 1, 0];
            if (param1 >= _loc_2.length)
            {
                return 55;
            }
            return _loc_2[param1];
        }// end function

        public static function getNextState(param1:int) : GameState
        {
            var _loc_2:PlayState = null;
            if (param1 >= totalLevelsCount)
            {
                return new GameCompleteState();
            }
            if ((param1 + 1) % 6 != 0)
            {
                return new PlayState(param1);
            }
            if ((param1 + 1) % 12 == 0)
            {
                _loc_2 = new PlayState(param1);
                _loc_2.setLongShootMode();
                return _loc_2;
            }
            return new GrifShootingState(param1);
        }// end function

        public static function get totalScore() : int
        {
            var _loc_2:int = 0;
            var _loc_1:int = 0;
            for each (_loc_2 in m_scorePerLevel)
            {
                
                _loc_1 = _loc_1 + _loc_2;
            }
            if (haveAchievement(Achievements.HALF_COMPLETED))
            {
                _loc_1 = _loc_1 + 10000;
            }
            if (haveAchievement(Achievements.CROWN))
            {
                _loc_1 = _loc_1 + 30000;
            }
            return _loc_1;
        }// end function

        public static function haveAds() : Boolean
        {
            return m_haveAds;
        }// end function

        public static function onRestart() : void
        {
            m_noInjureInRaw = 0;
            m_levelsInRaw = 0;
            return;
        }// end function

        private static function submitKongregateLevel() : void
        {
            if (hasKongregateAPI())
            {
                try
                {
                    kongregate.stats.submit("LevelsCompleted", levelsCompleted);
                }
                catch (e:Error)
                {
                    trace(e, e.getStackTrace());
                }
            }
            return;
        }// end function

        public static function wasNewAchievements() : Boolean
        {
            return m_oldAchiemeventCount != m_achievements.length;
        }// end function

        public static function getSelectLevelScreen() : GameState
        {
            if (m_curSelectLevelScreen == null)
            {
                if (levelsCompleted < 24)
                {
                    return new SelectLevelState(false);
                }
                if (levelsCompleted < 48)
                {
                    return new SelectLevelState(true);
                }
                return new SelectSecretLevelState();
            }
            else
            {
                switch(m_curSelectLevelScreen)
                {
                    case SCREEN_1_24:
                    {
                        return new SelectLevelState(false);
                    }
                    case SCREEN_25_48:
                    {
                        return new SelectLevelState(true);
                    }
                    case SCREEN_49_54:
                    {
                        return new SelectSecretLevelState();
                    }
                    default:
                    {
                        break;
                    }
                }
            }
            return null;
        }// end function

        public static function haveAchievement(param1:String) : Boolean
        {
            return m_achievements.indexOf(param1) != -1;
        }// end function

        public static function isHintsOn() : Boolean
        {
            return m_isHintsOn;
        }// end function

        public static function hasKongregateAPI() : Boolean
        {
            return m_isKongregate;
        }// end function

        private static function submitKongregateScore() : void
        {
            if (hasKongregateAPI())
            {
                try
                {
                    kongregate.stats.submit("Score", totalScore);
                }
                catch (e:Error)
                {
                    trace(e, e.getStackTrace());
                }
            }
            return;
        }// end function

        public static function isAlreadyPlayed(param1) : Boolean
        {
            return m_alreadyPlayed[param1];
        }// end function

        public static function onLoseLevel(param1:int, param2:int) : void
        {
            m_levelsInRaw = 0;
            m_noInjureInRaw = 0;
            m_killedCount = m_killedCount + param2;
            if (m_killedCount >= 100)
            {
                giveAchievement(Achievements.KILLED_100);
            }
            save();
            return;
        }// end function

        public static function isLevelWithStar(param1) : Boolean
        {
            return m_levelsWithStar[param1];
        }// end function

        public static function onEnterSelectLevelScreen(param1:String) : void
        {
            m_curSelectLevelScreen = param1;
            return;
        }// end function

        public static function getBestScore(param1:int) : int
        {
            return m_scorePerLevel[param1];
        }// end function

        public static function showTips() : void
        {
            var _loc_1:int = 0;
            while (_loc_1 < m_alreadyPlayed.length)
            {
                
                m_alreadyPlayed[_loc_1] = false;
                _loc_1++;
            }
            m_isHintsOn = true;
            save();
            return;
        }// end function

        public static function resetGame() : void
        {
            var _loc_1:int = 0;
            m_savedCount = 0;
            m_killedCount = 0;
            m_grifsCount = 0;
            m_levelsInRaw = 0;
            m_noInjureInRaw = 0;
            m_scorePerLevel = new Array();
            _loc_1 = 0;
            while (_loc_1 < totalLevelsCount)
            {
                
                m_scorePerLevel.push(0);
                _loc_1++;
            }
            m_levelsWithStar = new Array();
            _loc_1 = 0;
            while (_loc_1 < totalLevelsCount)
            {
                
                m_levelsWithStar.push(false);
                _loc_1++;
            }
            m_levelsCompleted = 0;
            m_achievements = new Array();
            onEnterSelectLevelScreen(SCREEN_1_24);
            save();
            return;
        }// end function

        public static function giveAchievement(param1:String) : void
        {
            if (Constant.m_debugMode)
            {
                trace("try to give", param1);
            }
            if (!haveAchievement(param1))
            {
                if (Constant.m_debugMode)
                {
                    trace("give", param1);
                }
                m_achievements.push(param1);
            }
            if (m_achievements.length == (Achievements.ALL.length - 1))
            {
                if (!haveAchievement(Achievements.CROWN))
                {
                    giveAchievement(Achievements.CROWN);
                }
            }
            return;
        }// end function

        public static function load() : void
        {
            var _loc_1:int = 0;
            var _loc_2:* = SharedObject.getLocal(Constant.SHARED_OBJECT_NAME, "/", false);
            if (_loc_2.size != 0)
            {
                m_levelsCompleted = _loc_2.data.m_levelsCompleted;
                m_scorePerLevel = _loc_2.data.m_scorePerLevel;
                m_levelsWithStar = _loc_2.data.m_levelsWithStar;
                m_achievements = _loc_2.data.m_achievements;
                m_savedCount = _loc_2.data.m_savedCount;
                m_killedCount = _loc_2.data.m_killedCount;
                m_grifsCount = _loc_2.data.m_grifsCount;
                m_isHintsOn = _loc_2.data.m_isHintsOn;
                m_invertedControl = _loc_2.data.m_invertedControl;
                SoundManager.setSoundVolume(_loc_2.data.m_soundVolume);
                SoundManager.setMusicVolume(_loc_2.data.m_musicVolume);
            }
            else
            {
                m_scorePerLevel = new Array();
                _loc_1 = 0;
                while (_loc_1 < totalLevelsCount)
                {
                    
                    m_scorePerLevel.push(0);
                    _loc_1++;
                }
                m_levelsWithStar = new Array();
                _loc_1 = 0;
                while (_loc_1 < totalLevelsCount)
                {
                    
                    m_levelsWithStar.push(false);
                    _loc_1++;
                }
            }
            if (m_achievements == null)
            {
                m_achievements = new Array();
            }
            return;
        }// end function

        public static function canSubmitScore() : Boolean
        {
            return true;
        }// end function

        public static function getBestScoreOnLevel(param1:int) : int
        {
            return m_scorePerLevel[param1];
        }// end function

        public static function onWinGrifShootingLevel(param1:int, param2:int) : void
        {
            m_grifsCount = m_grifsCount + param2;
            if (m_grifsCount >= 100)
            {
                giveAchievement(Achievements.GRIFS_KILLED);
            }
            submitKongregateScore();
            save();
            return;
        }// end function

        public static function save() : void
        {
            var _loc_1:* = SharedObject.getLocal(Constant.SHARED_OBJECT_NAME, "/");
            _loc_1.data.m_levelsCompleted = m_levelsCompleted;
            _loc_1.data.m_scorePerLevel = m_scorePerLevel;
            _loc_1.data.m_levelsWithStar = m_levelsWithStar;
            _loc_1.data.m_achievements = m_achievements;
            _loc_1.data.m_soundVolume = SoundManager.getSoundVolume();
            _loc_1.data.m_musicVolume = SoundManager.getMusicVolume();
            _loc_1.data.m_savedCount = m_savedCount;
            _loc_1.data.m_killedCount = m_killedCount;
            _loc_1.data.m_grifsCount = m_grifsCount;
            _loc_1.data.m_isHintsOn = m_isHintsOn;
            _loc_1.data.m_invertedControl = m_invertedControl;
            _loc_1.flush();
            _loc_1.close();
            return;
        }// end function

    }
}
