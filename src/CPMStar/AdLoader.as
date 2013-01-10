package CPMStar
{
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    import flash.system.*;

    public class AdLoader extends Sprite
    {
        private var cpmstarLoader:Loader;
        private var contentspotid:String;

        public function AdLoader(param1:String)
        {
            this.contentspotid = param1;
            addEventListener(Event.ADDED, addedHandler);
            return;
        }// end function

        private function dispatchHandler(event:Event) : void
        {
            dispatchEvent(event);
            return;
        }// end function

        private function addedHandler(event:Event) : void
        {
            removeEventListener(Event.ADDED, addedHandler);
            Security.allowDomain("server.cpmstar.com");
            var _loc_2:String = "http://server.cpmstar.com/adviewas3.swf";
            var _loc_3:* = parent;
            cpmstarLoader = new Loader();
            cpmstarLoader.contentLoaderInfo.addEventListener(Event.INIT, dispatchHandler);
            cpmstarLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, dispatchHandler);
            cpmstarLoader.load(new URLRequest(_loc_2 + "?contentspotid=" + contentspotid));
            addChild(cpmstarLoader);
            return;
        }// end function

    }
}
