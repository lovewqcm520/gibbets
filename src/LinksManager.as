package 
{
    import flash.net.*;

    public class LinksManager extends Object
    {
        public static const MAIN_MENU_HIGH_SCORE_BUTTON:String = "main_menu_high_score_button";
        public static const MINIGAME_WIN_SCREEN:String = "MINIGAME_WIN_SCREEN";
        public static const GRIF_SHOOTING_WIN_STATE_BUTTON:String = "grif_shooting_win_state_button";
        public static const SELECT_LEVEL_SCREEN:String = "SELECT_LEVEL_SCREEN";
        public static const SELECT_SECRET_LEVEL_SCREEN:String = "SELECT_SECRET_LEVEL_SCREEN";
        public static const WALKROUTGH_URL:String = "http://www.notdoppler.com/gibbets2-walkthrough.php?ref=gibbets2";
        public static const MAIN_MENU_NOTDOPPLER_BUTTON:String = "main_menu_notdoppler_button";
        public static const GAME_COMPLETE_NOTDOPPLER_BUTTON:String = "game_complete_notdoppler_button";
        public static const SELECT_LEVEL_STATE_WALKTHROUGH:String = "SELECT_LEVEL_STATE_WALKTHROUGH";
        public static const MAIN_MENU_MORE_GAMES_BUTTON:String = "main_menu_more_games_button";
        public static const GAME_COMPLETE_MORE_GAMES_BUTTON:String = "game_complete_more_games_button";
        public static const HIGH_SCORE_URL:String = "http://www.notdoppler.com/gibbets2-highscores.asd?ref=gibbets2&game=gibbets2";
        public static const GAME_COMPLETE_SUBMIT_BUTTON:String = "game_submit_button";
        public static const MINIGAME_SCREEN:String = "MINIGAME_SCREEN";
        public static const NO_SCREEN:String = "NO_SCREEN";
        public static const PLAYSTATE_SCREEN:String = "PLAYSTATE_SCREEN";
        public static const INTRO_SCREEN_BUTTON:String = "intro_screen_button";
        public static const PRELOADER_SCREEN_BANNER:String = "PRELOADER_SCREEN_BANNER";
        public static const SECRET_LEVEL_STATE_MORE_GAMES:String = "SECRET_LEVEL_STATE_MORE_GAMES";
        public static const MAIN_MENU_GIBBETS_I_BUTTON:String = "main_menu_gibbets_I_button";
        public static const PLAYSTATE_WALKTHROUGH:String = "PLAYSTATE_WALKTHROUGH";
        public static const CREDITS_SCREEN_NOTDOPPLER_BUTTON:String = "credits_screen_notdoppler_button";
        public static const LOSE_STATE_MORE_GAMES_BUTTON:String = "lose_state_more_games_button";
        public static const SECRET_LEVEL_STATE_WALKTHROUGH:String = "SECRET_LEVEL_STATE_WALKTHROUGH";
        public static const WIN_SCREEN:String = "WIN_SCREEN";
        public static const CREDITS_SCREEN:String = "CREDITS_SCREEN";
        public static const LOSE_SCREEN:String = "LOSE_SCREEN";
        public static const SELECT_LEVEL_STATE_MORE_GAMES:String = "SELECT_LEVEL_STATE_MORE_GAMES";
        public static const GAME_COMPLETE_SCREEN:String = "GAME_COMPLETE_SCREEN";
        public static const ACHIEVEMENTS_SCREEN:String = "ACHIEVEMENTS_SCREEN";
        public static const WIN_STATE_MORE_GAMES_BUTTON:String = "win_state_more_games_button";
        public static const MAIN_PAGE_URL:String = "http://www.notdoppler.com/?ref=gibbets2";
        public static const GIBBETS_II_URL:String = "http://www.notdoppler.com/gibbets2.asd";
        public static const PLAYSTATE_MORE_GAMES:String = "PLAYSTATE_MORE_GAMES";
        public static const GIBBETS_I_URL:String = "http://www.notdoppler.com/gibbets.asd?ref=gibbets2";

        public function LinksManager()
        {
            return;
        }// end function

        public static function goURL(param1:String, param2:String) : void
        {
            navigateToURL(new URLRequest(param1), "_blank");
            return;
        }// end function

    }
}
