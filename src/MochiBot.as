package 
{
    import flash.display.*;
    import flash.net.*;
    import flash.system.*;

    dynamic public class MochiBot extends Sprite
    {

        public function MochiBot()
        {
            return;
        }// end function

        public static function track(param1:Sprite, param2:String) : MochiBot
        {
            if (Security.sandboxType == "localWithFile")
            {
                return null;
            }
            var _loc_3:* = new MochiBot;
            param1.addChild(_loc_3);
            Security.allowDomain("*");
            Security.allowInsecureDomain("*");
            var _loc_4:String = "http://core.mochibot.com/my/core.swf";
            var _loc_5:* = new URLVariables();
            new URLVariables()["sb"] = Security.sandboxType;
            _loc_5["v"] = Capabilities.version;
            _loc_5["swfid"] = param2;
            _loc_5["mv"] = "8";
            _loc_5["fv"] = "9";
            var _loc_6:* = _loc_3.root.loaderInfo.loaderURL;
            if (_loc_3.root.loaderInfo.loaderURL.indexOf("http") == 0)
            {
                _loc_5["url"] = _loc_6;
            }
            else
            {
                _loc_5["url"] = "local";
            }
            var _loc_7:* = new URLRequest(_loc_4);
            new URLRequest(_loc_4).contentType = "application/x-www-form-urlencoded";
            _loc_7.method = URLRequestMethod.POST;
            _loc_7.data = _loc_5;
            var _loc_8:* = new Loader();
            _loc_3.addChild(_loc_8);
            _loc_8.load(_loc_7);
            return _loc_3;
        }// end function

    }
}
