package States
{
    import Main.*;
    import flash.events.*;
    import flash.utils.*;

    public class AchievementsState extends GameState
    {
        private static const BONUS_COLOR:String = "#FFCC00";
        private static const REQUIREMENTS_COLOR:String = "#FFCC00";
        private static const TITLE_COLOR:String = "#55FF55";

        public function AchievementsState()
        {
            return;
        }// end function

        private function onMenuClick(event:MouseEvent) : void
        {
            SoundManager.play(SoundConst.CLICK);
            StateManager.getInstance().coolChangeState(GameData.getSelectLevelScreen());
            return;
        }// end function

        override public function onCleanup() : void
        {
            m_view.m_buttonMenu.removeEventListener(MouseEvent.CLICK, onMenuClick);
            super.onCleanup();
            return;
        }// end function

        override public function onInit() : void
        {
            var _loc_2:String = null;
            var _loc_3:Achievement = null;
            var _loc_4:Hint = null;
            m_view = new AchievementsStateView();
            addChild(m_view);
            m_view.addChild(new MoreGamesPanel(LinksManager.ACHIEVEMENTS_SCREEN));
            var _loc_1:* = new Dictionary();
            _loc_1[Achievements.CROWN] = "<FONT COLOR=\'" + TITLE_COLOR + "\'>CROWN</FONT><br>" + "<br><FONT COLOR=\'" + REQUIREMENTS_COLOR + "\'>Requirements:</FONT> get all achievements.<br>" + "<br><FONT COLOR=\'" + BONUS_COLOR + "\'>Bonus:</FONT> +30 000 points.";
            _loc_1[Achievements.HALF_COMPLETED] = "<FONT COLOR=\'" + TITLE_COLOR + "\'>SILVER GIBBET</FONT><br>" + "<br><FONT COLOR=\'" + REQUIREMENTS_COLOR + "\'>Requirements:</FONT> Pass 24 levels.<br>" + "<br><FONT COLOR=\'" + BONUS_COLOR + "\'>Bonus:</FONT> +5 000 points.";
            _loc_1[Achievements.FULL_COMPLETED] = "<FONT COLOR=\'" + TITLE_COLOR + "\'>GOLDEN GIBBET</FONT><br>" + "<br><FONT COLOR=\'" + REQUIREMENTS_COLOR + "\'>Requirements:</FONT> Pass all levels.<br>" + "<br><FONT COLOR=\'" + BONUS_COLOR + "\'>Bonus:</FONT> +5 secret space levels.";
            _loc_1[Achievements.WITH_STAR_40] = "<FONT COLOR=\'" + TITLE_COLOR + "\'>STAR</FONT><br>" + "<br><FONT COLOR=\'" + REQUIREMENTS_COLOR + "\'>Requirements:</FONT> Pass 40 levels with a star rating.<br>" + "<br><FONT COLOR=\'" + BONUS_COLOR + "\'>Bonus:</FONT> +1 arrow at each level.";
            _loc_1[Achievements.ACCURACY_70] = "<FONT COLOR=\'" + TITLE_COLOR + "\'>SNIPER CUP</FONT><br>" + "<br><FONT COLOR=\'" + REQUIREMENTS_COLOR + "\'>Requirements:</FONT> pass minigame with 70% accuracy.<br>" + "<br><FONT COLOR=\'" + BONUS_COLOR + "\'>Bonus:</FONT> +5 additional arrows in minigame";
            _loc_1[Achievements.SAVES_50] = "<FONT COLOR=\'" + TITLE_COLOR + "\'>SILVER STATUETTE OF THE SAVER</FONT><br>" + "<br><FONT COLOR=\'" + REQUIREMENTS_COLOR + "\'>Requirements:</FONT> save 50 hangmans.<br>";
            _loc_1[Achievements.SAVES_100] = "<FONT COLOR=\'" + TITLE_COLOR + "\'>GOLDEN STATUETTE OF THE SAVER</FONT><br>" + "<br><FONT COLOR=\'" + REQUIREMENTS_COLOR + "\'>Requirements:</FONT> save 100 hangmans.<br>";
            _loc_1[Achievements.KILLED_100] = "<FONT COLOR=\'" + TITLE_COLOR + "\'>STATUETTE OF THE MUFF</FONT><br>" + "<br><FONT COLOR=\'" + REQUIREMENTS_COLOR + "\'>Requirements:</FONT> kill 100 hangmans.<br>";
            _loc_1[Achievements.GRIFS_KILLED] = "<FONT COLOR=\'" + TITLE_COLOR + "\'>STATUETTE OF THE GRIFFON HUNTER</FONT><br>" + "<br><FONT COLOR=\'" + REQUIREMENTS_COLOR + "\'>Requirements:</FONT> kill 100 of griffons in minigames." + "<br><FONT COLOR=\'" + BONUS_COLOR + "\'>Bonus:</FONT> +50 score for each killed griffin.";
            _loc_1[Achievements.HOUR_PLAYED] = "<FONT COLOR=\'" + TITLE_COLOR + "\'>SILVER CUP OF GIBBETS MASTER</FONT><br>" + "<br><FONT COLOR=\'" + REQUIREMENTS_COLOR + "\'>Requirements:</FONT> play for 1 hour on end.<br>";
            _loc_1[Achievements.TWO_HOURS_PLAYED] = "<FONT COLOR=\'" + TITLE_COLOR + "\'>GOLDEN CUP OF GIBBETS MASTER</FONT><br>" + "<br><FONT COLOR=\'" + REQUIREMENTS_COLOR + "\'>Requirements:</FONT> play for 2 hour on end.<br>" + "<br><FONT COLOR=\'" + BONUS_COLOR + "\'>Bonus:</FONT> Arrows don\'t hit hangmans at the 51st level.";
            _loc_1[Achievements.LEVEL_30_IN_6_SHOT] = "<FONT COLOR=\'" + TITLE_COLOR + "\'>SILVER BOW OF SNIPER</FONT><br>" + "<br><FONT COLOR=\'" + REQUIREMENTS_COLOR + "\'>Requirements:</FONT> pass 31st level with only 6 arrows shot.<br>" + "<br><FONT COLOR=\'" + BONUS_COLOR + "\'>Bonus:</FONT> hangmans suffocate for 10% slower.";
            _loc_1[Achievements.LEVEL_44_IN_6_SHOT] = "<FONT COLOR=\'" + TITLE_COLOR + "\'>GOLDEN BOW OF SNIPER</FONT><br>" + "<br><FONT COLOR=\'" + REQUIREMENTS_COLOR + "\'>Requirements:</FONT> pass 45th level with only 7 arrows shot.<br>" + "<br><FONT COLOR=\'" + BONUS_COLOR + "\'>Bonus:</FONT> hangmans get 20% less damage from arrows.";
            _loc_1[Achievements.LEVELS_WITHOUT_LOSE] = "<FONT COLOR=\'" + TITLE_COLOR + "\'>SILVER CUP OF WINNER</FONT>" + "<br><FONT COLOR=\'" + REQUIREMENTS_COLOR + "\'>Requirements:</FONT> pass 10 levels in row without losses and replays." + "<br><FONT COLOR=\'" + BONUS_COLOR + "\'>Bonus:</FONT> additional 100 score points for each saved hangman.";
            _loc_1[Achievements.LEVELS_WITHOUT_INJURE] = "<FONT COLOR=\'" + TITLE_COLOR + "\'>GOLDEN CUP OF WINNER</FONT>" + "<br><FONT COLOR=\'" + REQUIREMENTS_COLOR + "\'>Requirements:</FONT> pass 5 levels in row without losses and replays and damaging of hangmans." + "<br><FONT COLOR=\'" + BONUS_COLOR + "\'>Bonus:</FONT> additional 200 score points for each saved hangman.";
            for each (_loc_2 in Achievements.ALL)
            {
                
                _loc_3 = m_view.getChildByName(_loc_2) as Achievement;
                if (_loc_3)
                {
                    if (!GameData.haveAchievement(_loc_2))
                    {
                        _loc_3.alpha = 0;
                    }
                    else
                    {
                        _loc_3.alpha = 1;
                    }
                    _loc_4 = new Hint();
                    if (_loc_1[_loc_2])
                    {
                        _loc_4.setText(_loc_1[_loc_2]);
                    }
                    _loc_3.setHint(_loc_4);
                    m_view.addChild(_loc_4);
                }
            }
            m_view.m_buttonMenu.addEventListener(MouseEvent.CLICK, onMenuClick);
            SoundManager.playLoop(SoundConst.MAIN_MENU_MUSIC);
            return;
        }// end function

    }
}
