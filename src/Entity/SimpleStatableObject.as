package Entity
{
    import flash.display.*;

    public class SimpleStatableObject extends MovieClip
    {
        protected var m_state:String = null;
        protected var m_stateTime:Number = 0;

        public function SimpleStatableObject()
        {
            return;
        }// end function

        final public function changeState(param1:String) : void
        {
            onChangeState(m_state, param1);
            m_stateTime = 0;
            m_state = param1;
            return;
        }// end function

        protected function onChangeState(param1:String, param2:String) : void
        {
            return;
        }// end function

        final public function update(param1:Number) : void
        {
            m_stateTime = m_stateTime + param1;
            vUpdate(param1);
            return;
        }// end function

        protected function vUpdate(param1:Number) : void
        {
            return;
        }// end function

    }
}
