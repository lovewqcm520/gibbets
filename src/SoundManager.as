package 
{
    import flash.media.*;
    import flash.system.*;

    public class SoundManager extends Object
    {
        private static const vtNormal:int = 2;
        private static var m_volumeType:int = 2;
        private static var m_musicVolume:Number = 1;
        private static const vtFadeOut:int = 0;
        private static var m_isSoundEnable:Boolean = true;
        private static const vtFadeIn:int = 1;
        private static var m_currentLoop:SoundChannel;
        private static var m_musicVolumeBackup:Number;
        private static var m_liveTime:Number;
        private static var m_soundVolume:Number = 1;
        private static var m_currentLoopName:String;
        private static var m_soundAfterFade:String;

        public function SoundManager()
        {
            return;
        }// end function

        public static function playFadeOut(param1:String) : void
        {
            m_musicVolumeBackup = m_musicVolume;
            m_volumeType = vtFadeOut;
            m_soundAfterFade = param1;
            return;
        }// end function

        public static function setSoundVolume(param1:Number) : void
        {
            m_soundVolume = param1;
            return;
        }// end function

        public static function update(param1:Number) : void
        {
            m_liveTime = m_liveTime + param1;
            if (m_isSoundEnable)
            {
                switch(m_volumeType)
                {
                    case vtFadeOut:
                    {
                        setMusicVolume(m_musicVolume - 0.8 * param1);
                        if (m_musicVolume <= 0.15)
                        {
                            play(m_soundAfterFade);
                            m_volumeType = vtNormal;
                            m_liveTime = 0;
                        }
                        break;
                    }
                    case vtNormal:
                    {
                        if (m_liveTime > 2.3 && m_soundAfterFade)
                        {
                            m_soundAfterFade = null;
                            m_volumeType = vtFadeIn;
                        }
                        break;
                    }
                    case vtFadeIn:
                    {
                        setMusicVolume(m_musicVolume + 1.5 * param1);
                        if (m_musicVolume >= m_musicVolumeBackup)
                        {
                            setMusicVolume(m_musicVolumeBackup);
                            m_volumeType = vtNormal;
                        }
                        break;
                    }
                    default:
                    {
                        break;
                    }
                }
            }
            return;
        }// end function

        public static function getSoundVolume() : Number
        {
            return m_soundVolume;
        }// end function

        public static function setMusicVolume(param1:Number) : void
        {
            var _loc_2:SoundTransform = null;
            if (param1 < 0.01)
            {
                param1 = 0;
            }
            if (param1 > 1)
            {
                param1 = 1;
            }
            m_musicVolume = param1;
            if (m_currentLoop)
            {
                _loc_2 = m_currentLoop.soundTransform;
                _loc_2.volume = param1;
                m_currentLoop.soundTransform = _loc_2;
            }
            return;
        }// end function

        public static function getMusicVolume() : Number
        {
            return m_musicVolume;
        }// end function

        public static function forcedPlay(param1:String) : void
        {
            var sound_class:Class;
            var sound:Sound;
            var channel:SoundChannel;
            var transform:SoundTransform;
            var name:* = param1;
            try
            {
                sound_class = ApplicationDomain.currentDomain.getDefinition(name) as Class;
                sound = new sound_class;
                channel = sound.play();
                transform = channel.soundTransform;
                transform.volume = m_soundVolume;
                channel.soundTransform = transform;
            }
            catch (e:Error)
            {
                if (Constant.m_debugMode)
                {
                    trace(e);
                }
            }
            return;
        }// end function

        public static function setSoundEnable(param1:Boolean) : void
        {
            var _loc_2:String = null;
            m_volumeType = vtNormal;
            m_isSoundEnable = param1;
            if (m_isSoundEnable)
            {
                _loc_2 = m_currentLoopName;
                m_currentLoopName = "";
                playLoop(_loc_2);
            }
            else if (m_currentLoop)
            {
                m_currentLoop.stop();
            }
            return;
        }// end function

        public static function play(param1:String) : void
        {
            var sound_class:Class;
            var sound:Sound;
            var channel:SoundChannel;
            var transform:SoundTransform;
            var name:* = param1;
            if (m_isSoundEnable)
            {
                try
                {
                    sound_class = ApplicationDomain.currentDomain.getDefinition(name) as Class;
                    sound = new sound_class;
                    channel = sound.play();
                    transform = channel.soundTransform;
                    transform.volume = m_soundVolume;
                    channel.soundTransform = transform;
                }
                catch (e:Error)
                {
                    if (Constant.m_debugMode)
                    {
                        trace(e);
                    }
                }
            }
            return;
        }// end function

        public static function playLoop(param1:String) : void
        {
            var sound_class:Class;
            var sound:Sound;
            var transform:SoundTransform;
            var name:* = param1;
            try
            {
                if (m_isSoundEnable)
                {
                    if (m_currentLoopName != name)
                    {
                        if (m_currentLoop != null)
                        {
                            m_currentLoop.stop();
                        }
                        sound_class = ApplicationDomain.currentDomain.getDefinition(name) as Class;
                        sound = new sound_class;
                        m_currentLoop = sound.play(0, int.MAX_VALUE);
                        transform = m_currentLoop.soundTransform;
                        transform.volume = m_musicVolume;
                        m_currentLoop.soundTransform = transform;
                    }
                }
                m_currentLoopName = name;
            }
            catch (e:Error)
            {
                if (Constant.m_debugMode)
                {
                    trace("SoundManager::playLoop", e);
                }
            }
            return;
        }// end function

    }
}
