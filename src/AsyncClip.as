package 
{
    import flash.display.*;

    public class AsyncClip extends MovieClip
    {

        public function AsyncClip()
        {
            gotoAndPlay(this.int(totalFrames * Math.random()));
            return;
        }// end function

    }
}
