package Gibbets_II_fla
{
    import flash.display.*;
    import flash.net.*;
    import flash.system.*;

    dynamic public class highscoreloader_54 extends MovieClip
    {
        public var connectionID:Number;
        public var view:Number;
        public var readytoSend:Boolean;
        public var viewURL:String;
        public var connected:Boolean;
        public var score:Number;
        public var loader:Object;
        public var AS3_lc:LocalConnection;
        public var game:String;

        public function highscoreloader_54()
        {
            addFrameScript(0, frame1, 1, frame2);
            return;
        }// end function

        public function as2Ready() : void
        {
            trace("AS2 Ready");
            readytoSend = true;
            AS3_lc.send("_AS3toAS2_" + connectionID, "communicateData", game, score, view, viewURL, "fl3m_uP_Ebri8zi8#" + game + score + "2I2RI3tH6ahl?");
            return;
        }// end function

        function frame2()
        {
            Security.allowInsecureDomain("*");
            Security.allowDomain("*");
            readytoSend = false;
            connected = false;
            connectionID = 1;
            loader = new Loader();
            loader.load(new URLRequest("http://www.notdoppler.com/highscores/highscores.swf"));
            addChild(loader);
            AS3_lc = new LocalConnection();
            AS3_lc.allowDomain("*");
            AS3_lc.allowInsecureDomain("*");
            do
            {
                
                try
                {
                    AS3_lc.connect("_AS2toAS3_" + connectionID);
                    connected = true;
                }
                catch (error:ArgumentError)
                {
                    trace("AS3: Connection No:" + connectionID + " is already in use!");
                    (connectionID + 1);
                }
            }while (!connected && connectionID < 5)
            AS3_lc.client = this;
            return;
        }// end function

        public function loadHighscores(param1, param2, param3, param4)
        {
            game = param1;
            score = param2;
            view = param3;
            viewURL = param4;
            this.visible = true;
            gotoAndStop(2);
            resendData();
            return;
        }// end function

        function frame1()
        {
            stop();
            this.visible = false;
            return;
        }// end function

        public function resendData() : void
        {
            trace("resendData");
            if (readytoSend)
            {
                as2Ready();
            }
            return;
        }// end function

    }
}
