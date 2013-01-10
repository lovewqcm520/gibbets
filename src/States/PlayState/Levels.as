package States.PlayState
{

    public class Levels extends Object
    {
        private static const LEVEL_27:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="OvercastSky"/>
		  <Object scaleX="1" scaleY="1" type="background" x="-1" y="344" rotation="0" clip_name="Back4"/>
		  <Object type="shooting_point" x="74" y="412" rotation="59.99946594238281" clip_name="BowPoint"/>
		  <Object type="gibbet" pers_id="1" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="115" y="222" rotation="0" clip_name="HangerPoint"/>
		  <Object scaleX="1" scaleY="1" type="background" x="284" y="233" rotation="0" clip_name="tree_10"/>
		  <Object type="ground" x="320" y="461" rotation="0" clip_name="Ground"/>
		  <Object type="hedhehog_ghost" speed="0" charge="1" x="572" y="374" rotation="-42.00006103515625" clip_name="ArrowGhost1"/>
		  <Object type="gibbet_obliquely" inverted="false" x="75" y="235" rotation="0" clip_name="GibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="56" y="268" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="true" x="21" y="347" rotation="0" clip_name="ComposedStone99"/>
		  <Object type="static_box" is_stone="false" x="89" y="217" rotation="0" clip_name="GibbetStick"/>
		  <Object type="hedhehog_ghost" speed="0" charge="1" x="227" y="222" rotation="-0.0008697509765625" clip_name="ArrowGhost1"/>
		  <Object type="teleport_ghost" x="225" y="293" rotation="0" clip_name="States.PlayState::TeleportGhost"/>
		  <Object type="hedhehog_ghost" speed="0" charge="1" x="572" y="259" rotation="-42.00006103515625" clip_name="ArrowGhost1"/>
		  <Object type="gibbet" pers_id="2" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="115" y="106" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet_obliquely" inverted="false" x="75" y="118" rotation="0" clip_name="GibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="56" y="152" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="89" y="100" rotation="0" clip_name="GibbetStick"/>
		  <Object type="ammo_ghost" power="5" x="420" y="128" rotation="0" clip_name="AmmoGhost5"/>
		  <Object type="static_box" is_stone="true" x="706" y="78" rotation="0" clip_name="ComposedStone99"/>
		  <Object type="gibbet" pers_id="4" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="552" y="99" rotation="0" clip_name="HangerPoint"/>
		  <Object type="points_ghost" power="500" x="507" y="410" rotation="0" clip_name="PointsGhost500"/>
		  <Object type="points_ghost" power="500" x="423" y="410" rotation="0" clip_name="PointsGhost500"/>
		  <Object scaleX="1" scaleY="1" width="26.8" height="37.35" type="frontground" x="528" y="404" rotation="0" clip_name="flower_6"/>
		  <Object scaleX="1" scaleY="1" width="50.85" height="25.2" type="frontground" x="114" y="421" rotation="0" clip_name="flower_5"/>
		  <Object type="vulture" inverted="false" x="61" y="72" rotation="0" clip_name="VultureHere"/>
		  <Object type="cloud" x="671" y="76" rotation="0" clip_name="Cloud9"/>
		  <Object type="cloud" x="487" y="18" rotation="0" clip_name="Cloud8"/>
		  <Object type="cloud" x="284" y="40" rotation="0" clip_name="Cloud5"/>
		  <Object type="cloud" x="157" y="36" rotation="0" clip_name="Cloud3"/>
		  <Object type="cloud" x="-71" y="18" rotation="0" clip_name="Cloud1"/>
		  <Object type="cloud" x="-260" y="49" rotation="0" clip_name="Cloud0"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="107" y="212" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="107" y="95" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="55" y="216" rotation="0" clip_name="Screw"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="55" y="100" rotation="0" clip_name="Screw"/>
		</Level>;
        private static const LEVEL_28:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="Background"/>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="358" rotation="0" clip_name="Back2"/>
		  <Object scaleX="1" scaleY="1" type="background" x="295" y="284" rotation="0" clip_name="tree_3"/>
		  <Object type="dynamic_box" x="222" y="431" rotation="0" clip_name="Box"/>
		  <Object type="dynamic_box" x="222" y="406" rotation="0" clip_name="Box"/>
		  <Object type="dynamic_box" x="222" y="381" rotation="0" clip_name="Box"/>
		  <Object type="dynamic_box" x="222" y="356" rotation="0" clip_name="Box"/>
		  <Object type="dynamic_box" x="222" y="331" rotation="0" clip_name="Box"/>
		  <Object type="dynamic_box" x="222" y="306" rotation="0" clip_name="Box"/>
		  <Object type="shooting_point" x="593" y="307" rotation="-89.99563598632813" clip_name="BowPoint"/>
		  <Object type="ground" x="320" y="461" rotation="0" clip_name="Ground"/>
		  <Object type="gibbet" pers_id="4" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="208" y="74" rotation="0" clip_name="HangerPoint"/>
		  <Object type="tnt_barrel" x="272" y="210" rotation="0" clip_name="States.PlayState::TNTBarrel"/>
		  <Object type="dynamic_box" x="338" y="218" rotation="0" clip_name="Box"/>
		  <Object type="dynamic_box" x="338" y="193" rotation="0" clip_name="Box"/>
		  <Object type="static_box" is_stone="true" x="307" y="249" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="273" y="249" rotation="0" clip_name="Stone2"/>
		  <Object type="teleport_ghost" x="134" y="222" rotation="0" clip_name="States.PlayState::TeleportGhost"/>
		  <Object type="hedhehog_ghost" speed="0" charge="1" x="99" y="379" rotation="33.00028991699219" clip_name="ArrowGhost1"/>
		  <Object type="dynamic_box" x="338" y="168" rotation="0" clip_name="Box"/>
		  <Object type="dynamic_box" x="338" y="143" rotation="0" clip_name="Box"/>
		  <Object type="dynamic_box" x="338" y="119" rotation="0" clip_name="Box"/>
		  <Object type="dynamic_box" x="338" y="94" rotation="0" clip_name="Box"/>
		  <Object type="static_box" is_stone="true" x="341" y="249" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="410" y="249" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="376" y="249" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="444" y="249" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="513" y="249" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="479" y="249" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="547" y="249" rotation="0" clip_name="Stone1"/>
		  <Object type="hedhehog_ghost" speed="0" charge="1" x="600" y="188" rotation="-69.99934387207031" clip_name="ArrowGhost1"/>
		  <Object type="static_box" is_stone="true" x="209" y="54" rotation="0" clip_name="Stone1"/>
		  <Object type="gibbet" pers_id="1" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="49" y="105" rotation="0" clip_name="HangerPoint"/>
		  <Object type="static_box" is_stone="true" x="50" y="84" rotation="0" clip_name="Stone1"/>
		  <Object type="tnt_barrel" x="289" y="423" rotation="0" clip_name="States.PlayState::TNTBarrel"/>
		  <Object scaleX="1" scaleY="1" width="27.65" height="18.1" type="frontground" x="46" y="426" rotation="0" clip_name="herb"/>
		  <Object scaleX="1" scaleY="1" width="27.55" height="35.7" type="frontground" x="594" y="406" rotation="0" clip_name="flower_0"/>
		  <Object type="sun" x="569" y="72" rotation="0" clip_name="States.PlayState::Sun"/>
		  <Object type="cloud" x="439" y="37" rotation="0" clip_name="Cloud5"/>
		  <Object type="cloud" x="643" y="77" rotation="0" clip_name="Cloud6"/>
		  <Object type="cloud" x="299" y="41" rotation="0" clip_name="Cloud7"/>
		  <Object type="cloud" x="98" y="81" rotation="0" clip_name="Cloud2"/>
		  <Object type="cloud" x="-50" y="22" rotation="0" clip_name="Cloud1"/>
		</Level>;
        private static const LEVEL_23:XML = null;
        private static const LEVEL_25:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="OvercastSky"/>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="344" rotation="0" clip_name="Back4"/>
		  <Object type="shooting_point" x="609" y="416" rotation="-45" clip_name="BowPoint"/>
		  <Object type="gibbet" pers_id="1" path_to_hang="HEAD" connect_legs="false" chains_count="9" x="103" y="153" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet" pers_id="2" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="102" y="337" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet_obliquely" inverted="false" x="45" y="350" rotation="0" clip_name="GibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="27" y="385" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="true" x="431" y="349" rotation="0" clip_name="Stone0"/>
		  <Object type="static_box" is_stone="true" x="431" y="383" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="431" y="417" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="431" y="451" rotation="0" clip_name="Stone3"/>
		  <Object scaleX="1" scaleY="1" type="background" x="471" y="268" rotation="0" clip_name="tree_9"/>
		  <Object type="ground" x="320" y="461" rotation="0" clip_name="Ground"/>
		  <Object type="hedhehog_ghost" speed="-60" charge="4" x="200" y="233" rotation="45" clip_name="ArrowGhost4"/>
		  <Object type="gibbet" pers_id="3" path_to_hang="HEAD" connect_legs="false" chains_count="8" x="296" y="153" rotation="0" clip_name="HangerPoint"/>
		  <Object type="teleport_ghost" x="274" y="408" rotation="0" clip_name="States.PlayState::TeleportGhost"/>
		  <Object type="static_box" is_stone="false" x="63" y="333" rotation="0" clip_name="GibbetStick"/>
		  <Object type="static_box" is_stone="false" x="27" y="265" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="27" y="200" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="63" y="149" rotation="0" clip_name="GibbetStick"/>
		  <Object type="static_box" is_stone="false" x="152" y="149" rotation="0" clip_name="GibbetStick"/>
		  <Object type="static_box" is_stone="false" x="242" y="149" rotation="0" clip_name="GibbetStick"/>
		  <Object type="static_box" is_stone="false" x="290" y="149" rotation="0" clip_name="GibbetStick"/>
		  <Object type="static_box" is_stone="true" x="352" y="162" rotation="0" clip_name="Stone0"/>
		  <Object type="static_box" is_stone="true" x="352" y="196" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="352" y="230" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="352" y="264" rotation="0" clip_name="Stone3"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="26" y="332" rotation="0" clip_name="Screw"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="26" y="149" rotation="0" clip_name="Screw"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="96" y="144" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="288" y="144" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="95" y="327" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" type="background" x="113" y="383" rotation="0" clip_name="BgStones"/>
		  <Object type="vulture" inverted="false" x="426" y="312" rotation="0" clip_name="VultureHere"/>
		  <Object type="cloud" x="119" y="23" rotation="0" clip_name="Cloud0"/>
		  <Object type="cloud" x="304" y="6" rotation="0" clip_name="Cloud1"/>
		  <Object type="cloud" x="547" y="37" rotation="0" clip_name="Cloud4"/>
		  <Object type="cloud" x="-46" y="31" rotation="0" clip_name="Cloud6"/>
		  <Object type="cloud" x="411" y="84" rotation="0" clip_name="Cloud7"/>
		  <Object type="cloud" x="-84" y="94" rotation="0" clip_name="Cloud9"/>
		  <Object scaleX="1" scaleY="1" width="50.85" height="25.2" type="frontground" x="319" y="420" rotation="0" clip_name="flower_5"/>
		</Level>;
        private static const LEVEL_29:XML = null;
        private static const LEVEL_21:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="Background"/>
		  <Object scaleX="1" scaleY="1" type="background" x="-3" y="330" rotation="0" clip_name="Back1"/>
		  <Object scaleX="1" scaleY="1" type="background" x="381" y="161" rotation="0" clip_name="tree_7"/>
		  <Object type="shooting_point" x="465" y="386" rotation="-45" clip_name="BowPoint"/>
		  <Object type="static_box" is_stone="true" x="236" y="433" rotation="0" clip_name="Stone2"/>
		  <Object type="ground" x="320" y="461" rotation="0" clip_name="Ground"/>
		  <Object type="gibbet" pers_id="3" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="313" y="153" rotation="0" clip_name="HangerPoint"/>
		  <Object type="hedhehog_ghost" speed="0" charge="1" x="104" y="141" rotation="100.00105285644531" clip_name="ArrowGhost1"/>
		  <Object type="hedhehog_ghost" speed="0" charge="1" x="104" y="181" rotation="89.9947509765625" clip_name="ArrowGhost1"/>
		  <Object type="hedhehog_ghost" speed="0" charge="1" x="104" y="222" rotation="70.0001220703125" clip_name="ArrowGhost1"/>
		  <Object type="hedhehog_ghost" speed="0" charge="1" x="237" y="299" rotation="-59.99946594238281" clip_name="ArrowGhost1"/>
		  <Object type="gibbet_obliquely" inverted="true" x="339" y="164" rotation="0" clip_name="InvertedGibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="357" y="200" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="321" y="147" rotation="0" clip_name="GibbetStick"/>
		  <Object type="hedhehog_ghost" speed="0" charge="1" x="237" y="360" rotation="-1.00006103515625" clip_name="ArrowGhost1"/>
		  <Object type="hedhehog_ghost" speed="0" charge="1" x="48" y="383" rotation="34.00025939941406" clip_name="ArrowGhost1"/>
		  <Object type="static_box" is_stone="true" x="236" y="399" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="289" y="276" rotation="0" clip_name="Stone0"/>
		  <Object type="static_box" is_stone="true" x="322" y="276" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="356" y="276" rotation="0" clip_name="Stone2"/>
		  <Object type="hedhehog_ghost" speed="0" charge="1" x="104" y="262" rotation="1.00006103515625" clip_name="ArrowGhost1"/>
		  <Object type="sun" x="99" y="75" rotation="0" clip_name="States.PlayState::Sun"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="357" y="147" rotation="0" clip_name="Screw"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="305" y="142" rotation="0" clip_name="RopeRings"/>
		  <Object type="points_ghost" power="500" x="308" y="112" rotation="0" clip_name="PointsGhost500"/>
		  <Object scaleX="1" scaleY="1" width="27.65" height="18.1" type="frontground" x="113" y="427" rotation="0" clip_name="herb"/>
		  <Object type="cloud" x="137" y="26" rotation="0" clip_name="Cloud0"/>
		  <Object type="cloud" x="408" y="30" rotation="0" clip_name="Cloud1"/>
		  <Object type="cloud" x="637" y="76" rotation="0" clip_name="Cloud2"/>
		  <Object type="cloud" x="-33" y="68" rotation="0" clip_name="Cloud3"/>
		  <Object type="cloud" x="-233" y="17" rotation="0" clip_name="Cloud5"/>
		</Level>;
        private static const LEVEL_0:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="Background"/>
		  <Object type="gibbet_obliquely" inverted="true" x="559" y="350" rotation="0" clip_name="InvertedGibbetObliquely"/>
		  <Object type="cloud" x="108" y="96" rotation="0" clip_name="Cloud3"/>
		  <Object x="0" y="0" rotation="0" clip_name="ToPullBowHint"/>
		  <Object type="cloud" x="374" y="147" rotation="0" clip_name="Cloud2"/>
		  <Object scaleX="1" scaleY="1" type="background" x="-1" y="358" rotation="0" clip_name="Back2"/>
		  <Object scaleX="1" scaleY="1" type="background" x="22" y="368" rotation="0" clip_name="tree_2"/>
		  <Object type="ground" x="320" y="461" rotation="0" clip_name="Ground"/>
		  <Object type="cloud" x="-126" y="27" rotation="0" clip_name="Cloud1"/>
		  <Object x="0" y="0" rotation="0" clip_name="TryToAimHint"/>
		  <Object type="cloud" x="269" y="18" rotation="0" clip_name="Cloud0"/>
		  <Object type="sun" x="550" y="82" rotation="0" clip_name="States.PlayState::Sun"/>
		  <Object type="cloud" x="602" y="52" rotation="0" clip_name="Cloud5"/>
		  <Object scaleX="1" scaleY="1" width="27.55" height="35.7" type="frontground" x="358" y="407" rotation="0" clip_name="flower_0"/>
		  <Object scaleX="1" scaleY="1" width="27.65" height="18.1" type="frontground" x="176" y="427" rotation="0" clip_name="herb"/>
		  <Object type="static_box" is_stone="false" x="578" y="385" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="543" y="333" rotation="180" clip_name="GibbetStick"/>
		  <Object type="gibbet" pers_id="1" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="531" y="339" rotation="0" clip_name="HangerPoint" cloud_name="ShotTheRopeNotMeCloud" cloud_prob="1"/>
		  <Object type="shooting_point" x="208" y="355" rotation="59.99946594238281" clip_name="BowPoint"/>
		  <Object type="highlight" size="150" x="530" y="377" rotation="0" clip_name="YouWillGetAStar"/>
		  <Object type="highlight" size="150" x="530" y="357" rotation="0" clip_name="TryToAimHint"/>
		  <Object type="highlight" size="150" x="208" y="355" rotation="0" clip_name="ToPullBowHint"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="523" y="328" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="578" y="333" rotation="0" clip_name="Screw"/>
		</Level>;
        private static const LEVEL_1:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="Background"/>
		  <Object type="gibbet_obliquely" inverted="true" x="498" y="349" rotation="0" clip_name="InvertedGibbetObliquely"/>
		  <Object scaleX="1" scaleY="1" type="background" x="-2" y="329" rotation="0" clip_name="Back1"/>
		  <Object scaleX="1" scaleY="1" type="background" x="301" y="229" rotation="0" clip_name="tree_4"/>
		  <Object type="gibbet_obliquely" inverted="false" x="157" y="350" rotation="0" clip_name="GibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="138" y="384" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="175" y="333" rotation="180" clip_name="GibbetStick"/>
		  <Object type="gibbet" pers_id="2" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="185" y="338" rotation="0" clip_name="HangerPoint"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="178" y="327" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="138" y="332" rotation="0" clip_name="Screw"/>
		  <Object type="ground" x="320" y="461" rotation="0" clip_name="Ground"/>
		  <Object type="shooting_point" x="322" y="381" rotation="59.99946594238281" clip_name="BowPoint"/>
		  <Object type="static_box" is_stone="false" x="517" y="384" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="482" y="333" rotation="180" clip_name="GibbetStick"/>
		  <Object type="gibbet" pers_id="3" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="470" y="338" rotation="0" clip_name="HangerPoint"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="463" y="327" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="517" y="332" rotation="0" clip_name="Screw"/>
		  <Object type="points_ghost" power="500" x="203" y="301" rotation="0" clip_name="PointsGhost500"/>
		  <Object type="highlight" size="150" x="201" y="302" rotation="0" clip_name="ThisIsBonusHint"/>
		  <Object type="sun" x="68" y="81" rotation="0" clip_name="States.PlayState::Sun"/>
		  <Object type="cloud" x="260" y="32" rotation="0" clip_name="Cloud0"/>
		  <Object type="cloud" x="448" y="122" rotation="0" clip_name="Cloud2"/>
		  <Object type="cloud" x="490" y="36" rotation="0" clip_name="Cloud3"/>
		  <Object type="cloud" x="133" y="110" rotation="0" clip_name="Cloud6"/>
		  <Object type="cloud" x="74" y="28" rotation="0" clip_name="Cloud8"/>
		  <Object type="cloud" x="581" y="104" rotation="0" clip_name="Cloud9"/>
		  <Object scaleX="1" scaleY="1" width="27.65" height="18.1" type="frontground" x="47" y="427" rotation="0" clip_name="herb"/>
		  <Object x="0" y="0" rotation="0" clip_name="ThisIsBonusHint"/>
		  <Object scaleX="-1" scaleY="1" width="28.45" height="36.5" type="frontground" x="601" y="400" rotation="0" clip_name="flower_4"/>
		</Level>;
        private static const LEVEL_2:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="Background"/>
		  <Object scaleX="1" scaleY="1" type="background" x="-1" y="357" rotation="0" clip_name="Back2"/>
		  <Object scaleX="1" scaleY="1" type="background" x="504" y="352" rotation="0" clip_name="tree_1"/>
		  <Object scaleX="1" scaleY="1" type="background" x="28" y="152" rotation="0" clip_name="tree_5"/>
		  <Object type="shooting_point" x="367" y="330" rotation="120.00117492675781" clip_name="BowPoint"/>
		  <Object type="gibbet" pers_id="4" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="125" y="344" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet_obliquely" inverted="false" x="100" y="355" rotation="0" clip_name="GibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="81" y="390" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="117" y="338" rotation="0" clip_name="GibbetStick"/>
		  <Object type="ground" x="320" y="461" rotation="0" clip_name="Ground"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="117" y="333" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="81" y="338" rotation="0" clip_name="Screw"/>
		  <Object type="ammo_ghost" power="5" x="476" y="409" rotation="0" clip_name="AmmoGhost5"/>
		  <Object type="ammo_ghost" power="10" x="565" y="409" rotation="0" clip_name="AmmoGhost10"/>
		  <Object type="gibbet" pers_id="3" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="151" y="125" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet_obliquely" inverted="false" x="115" y="136" rotation="0" clip_name="GibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="97" y="170" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="132" y="119" rotation="0" clip_name="GibbetStick"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="143" y="114" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="97" y="119" rotation="0" clip_name="Screw"/>
		  <Object type="gibbet" pers_id="2" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="551" y="158" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet_obliquely" inverted="true" x="582" y="170" rotation="0" clip_name="InvertedGibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="601" y="203" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="565" y="152" rotation="0" clip_name="GibbetStick"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="543" y="146" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="600" y="152" rotation="0" clip_name="Screw"/>
		  <Object type="gibbet_ground" x="558" y="298" rotation="0" clip_name="GibbetGround"/>
		  <Object type="gibbet_ground" x="120" y="266" rotation="0" clip_name="GibbetGround"/>
		  <Object type="highlight" size="150" x="475" y="409" rotation="0" clip_name="AmmoHint"/>
		  <Object x="0" y="0" rotation="0" clip_name="AmmoHint"/>
		  <Object scaleX="1" scaleY="1" width="27.65" height="18.1" type="frontground" x="112" y="427" rotation="0" clip_name="herb"/>
		  <Object scaleX="1" scaleY="1" width="38.7" height="43.05" type="frontground" x="351" y="400" rotation="0" clip_name="flower_2"/>
		  <Object type="sun" x="564" y="76" rotation="0" clip_name="States.PlayState::Sun"/>
		  <Object type="cloud" x="697" y="94" rotation="0" clip_name="Cloud9"/>
		  <Object type="cloud" x="492" y="36" rotation="0" clip_name="Cloud8"/>
		  <Object type="cloud" x="-156" y="59" rotation="0" clip_name="Cloud6"/>
		  <Object type="cloud" x="261" y="36" rotation="0" clip_name="Cloud5"/>
		  <Object type="cloud" x="13" y="14" rotation="0" clip_name="Cloud4"/>
		  <Object type="highlight" size="150" x="308" y="30" rotation="0" clip_name="TheAmountOfArrows"/>
		  <Object x="0" y="0" rotation="0" clip_name="TheAmountOfArrows"/>
		</Level>;
        private static const LEVEL_3:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="Background"/>
		  <Object type="gibbet_obliquely" inverted="true" x="584" y="154" rotation="0" clip_name="InvertedGibbetObliquely"/>
		  <Object scaleX="1.0068817138671875" scaleY="1" type="background" x="-4" y="331" rotation="0" clip_name="Back1"/>
		  <Object type="static_box" is_stone="true" x="148" y="426" rotation="0" clip_name="Stone3"/>
		  <Object type="shooting_point" x="358" y="163" rotation="-79.99894714355469" clip_name="BowPoint"/>
		  <Object type="gibbet" pers_id="3" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="97" y="142" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet" pers_id="4" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="257" y="142" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet" pers_id="4" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="174" y="141" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet" pers_id="1" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="488" y="142" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet" pers_id="2" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="549" y="142" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet_obliquely" inverted="false" x="70" y="154" rotation="0" clip_name="GibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="53" y="187" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="87" y="136" rotation="0" clip_name="GibbetStick"/>
		  <Object type="static_box" is_stone="false" x="174" y="136" rotation="0" clip_name="GibbetStick"/>
		  <Object type="static_box" is_stone="false" x="235" y="136" rotation="0" clip_name="GibbetStick"/>
		  <Object type="static_box" is_stone="false" x="602" y="187" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="568" y="136" rotation="0" clip_name="GibbetStick"/>
		  <Object type="static_box" is_stone="false" x="516" y="136" rotation="0" clip_name="GibbetStick"/>
		  <Object type="static_box" is_stone="true" x="59" y="262" rotation="0" clip_name="Stone0"/>
		  <Object type="static_box" is_stone="true" x="93" y="262" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="127" y="262" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="161" y="262" rotation="0" clip_name="Stone3"/>
		  <Object type="static_box" is_stone="true" x="195" y="262" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="230" y="262" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="76" y="295" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="213" y="295" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="179" y="295" rotation="0" clip_name="Stone0"/>
		  <Object type="static_box" is_stone="true" x="144" y="295" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="110" y="295" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="95" y="328" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="129" y="328" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="164" y="328" rotation="0" clip_name="Stone3"/>
		  <Object type="static_box" is_stone="true" x="197" y="328" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="113" y="361" rotation="0" clip_name="Stone3"/>
		  <Object type="static_box" is_stone="true" x="147" y="361" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="181" y="362" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="130" y="394" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="164" y="394" rotation="0" clip_name="Stone0"/>
		  <Object type="static_box" is_stone="true" x="518" y="429" rotation="0" clip_name="Stone3"/>
		  <Object scaleX="1" scaleY="1" type="background" x="251" y="291" rotation="0" clip_name="tree_6"/>
		  <Object type="ground" x="320" y="461" rotation="0" clip_name="Ground"/>
		  <Object type="static_box" is_stone="true" x="428" y="265" rotation="0" clip_name="Stone0"/>
		  <Object type="static_box" is_stone="true" x="462" y="265" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="496" y="265" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="531" y="265" rotation="0" clip_name="Stone3"/>
		  <Object type="static_box" is_stone="true" x="565" y="265" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="599" y="265" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="445" y="298" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="582" y="298" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="548" y="298" rotation="0" clip_name="Stone0"/>
		  <Object type="static_box" is_stone="true" x="513" y="298" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="479" y="298" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="465" y="331" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="498" y="331" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="532" y="331" rotation="0" clip_name="Stone3"/>
		  <Object type="static_box" is_stone="true" x="566" y="331" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="483" y="364" rotation="0" clip_name="Stone3"/>
		  <Object type="static_box" is_stone="true" x="517" y="364" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="551" y="365" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="500" y="397" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="534" y="397" rotation="0" clip_name="Stone0"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="480" y="131" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="541" y="131" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="249" y="131" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="167" y="131" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="89" y="131" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="602" y="136" rotation="0" clip_name="Screw"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="53" y="136" rotation="0" clip_name="Screw"/>
		  <Object scaleX="1" scaleY="1" width="27.65" height="18.1" type="frontground" x="192" y="427" rotation="0" clip_name="herb"/>
		  <Object scaleX="1" scaleY="1" width="27.65" height="18.1" type="frontground" x="436" y="426" rotation="0" clip_name="herb"/>
		  <Object scaleX="1" scaleY="1" width="27.55" height="35.7" type="frontground" x="584" y="407" rotation="0" clip_name="flower_0"/>
		  <Object scaleX="1" scaleY="1" width="44.95" height="42.55" type="frontground" x="19" y="401" rotation="0" clip_name="flower_3"/>
		  <Object type="sun" x="68" y="68" rotation="0" clip_name="States.PlayState::Sun"/>
		  <Object type="cloud" x="368" y="49" rotation="0" clip_name="Cloud7"/>
		  <Object type="cloud" x="586" y="22" rotation="0" clip_name="Cloud6"/>
		  <Object type="cloud" x="130" y="22" rotation="0" clip_name="Cloud5"/>
		  <Object type="cloud" x="-181" y="10" rotation="0" clip_name="Cloud4"/>
		  <Object type="cloud" x="467" y="90" rotation="0" clip_name="Cloud9"/>
		  <Object type="points_ghost" power="500" x="218" y="415" rotation="0" clip_name="PointsGhost500"/>
		  <Object type="highlight" size="150" x="173" y="161" rotation="0" clip_name="ComboSave3Hint"/>
		  <Object type="highlight" size="150" x="517" y="157" rotation="0" clip_name="ComboSave2Hint"/>  
		  <Object x="0" y="0" rotation="0" clip_name="ComboSave2Hint"/>
		  <Object x="0" y="0" rotation="0" clip_name="ComboSave3Hint"/>
		  <Object type="points_ghost" power="500" x="425" y="415" rotation="0" clip_name="PointsGhost500"/>
		</Level>;
        private static const LEVEL_4:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="Background"/>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="358" rotation="0" clip_name="Back2"/>
		  <Object scaleX="1" scaleY="1" type="background" x="135" y="230" rotation="0" clip_name="tree_4"/>
		  <Object type="static_box" is_stone="true" x="577" y="427" rotation="0" clip_name="Stone0"/>
		  <Object type="static_box" is_stone="true" x="576" y="392" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="577" y="358" rotation="0" clip_name="Stone3"/>
		  <Object type="static_box" is_stone="true" x="576" y="323" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="577" y="289" rotation="0" clip_name="Stone0"/>
		  <Object type="shooting_point" x="34" y="396" rotation="45" clip_name="BowPoint"/>
		  <Object type="highlight" size="150" x="34" y="396" rotation="0" clip_name="InvertControlHint"/>
		  <Object type="gibbet" pers_id="2" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="438" y="282" rotation="0" clip_name="HangerPoint"/>
		  <Object type="static_box" is_stone="true" x="377" y="427" rotation="0" clip_name="Stone0"/>
		  <Object type="ground" x="320" y="461" rotation="0" clip_name="Ground"/>
		  <Object type="sun" x="568" y="89" rotation="0" clip_name="States.PlayState::Sun"/>
		  <Object type="static_box" is_stone="true" x="377" y="392" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="377" y="358" rotation="0" clip_name="Stone3"/>
		  <Object type="static_box" is_stone="true" x="377" y="289" rotation="0" clip_name="Stone0"/>
		  <Object type="static_box" is_stone="false" x="393" y="233" rotation="45" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="434" y="191" rotation="45" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="563" y="236" rotation="-45" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="516" y="187" rotation="-45" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="438" y="276" rotation="0" clip_name="GibbetStick"/>
		  <Object type="gibbet" pers_id="2" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="513" y="281" rotation="0" clip_name="HangerPoint" cloud_name="StopItCloud" cloud_prob="0.3"/>
		  <Object type="static_box" is_stone="false" x="514" y="276" rotation="0" clip_name="GibbetStick"/>
		  <Object type="cow" inverted="true" x="303" y="321" rotation="0" clip_name="InvertedCowHere"/>
		  <Object scaleX="1" scaleY="1" width="27.65" height="18.1" type="frontground" x="48" y="427" rotation="0" clip_name="herb"/>
		  <Object scaleX="1" scaleY="1" width="27.65" height="18.1" type="frontground" x="472" y="429" rotation="0" clip_name="herb"/>
		  <Object type="cloud" x="397" y="85" rotation="0" clip_name="Cloud9"/>
		  <Object type="cloud" x="275" y="28" rotation="0" clip_name="Cloud8"/>
		  <Object type="cloud" x="494" y="18" rotation="0" clip_name="Cloud6"/>
		  <Object type="cloud" x="42" y="34" rotation="0" clip_name="Cloud5"/>
		  <Object type="cloud" x="688" y="76" rotation="0" clip_name="Cloud2"/>
		  <Object type="cloud" x="-121" y="10" rotation="0" clip_name="Cloud1"/>
		  <Object type="points_ghost" power="1000" x="560" y="157" rotation="0" clip_name="PointsGhost1000"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="505" y="270" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="431" y="270" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="477" y="148" rotation="0" clip_name="Screw"/>
		</Level>;
        private static const LEVEL_5:XML = null;
        private static const LEVEL_6:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="Background"/>
		  <Object scaleX="1" scaleY="1" type="background" x="-3" y="331" rotation="0" clip_name="Back1"/>
		  <Object scaleX="1" scaleY="1" type="background" x="107" y="161" rotation="0" clip_name="tree_7"/>
		  <Object type="ground" x="320" y="461" rotation="0" clip_name="Ground"/>
		  <Object type="shooting_point" x="52" y="411" rotation="59.99946594238281" clip_name="BowPoint"/>
		  <Object type="gibbet_obliquely" inverted="true" x="577" y="184" rotation="0" clip_name="InvertedGibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="596" y="218" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="gibbet" pers_id="4" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="541" y="173" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet_ground" x="556" y="312" rotation="0" clip_name="GibbetGround"/>
		  <Object type="static_box" is_stone="false" x="562" y="167" rotation="0" clip_name="GibbetStick"/>
		  <Object type="gibbet_obliquely" inverted="false" x="83" y="174" rotation="0" clip_name="GibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="65" y="209" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="gibbet" pers_id="1" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="118" y="163" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet_ground" x="101" y="302" rotation="0" clip_name="GibbetGround"/>
		  <Object type="static_box" is_stone="false" x="98" y="157" rotation="0" clip_name="GibbetStick"/>
		  <Object type="teleport_ghost" x="548" y="404" rotation="0" clip_name="States.PlayState::TeleportGhost"/>
		  <Object type="highlight" size="150" x="547" y="403" rotation="0" clip_name="TeleportHint"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="533" y="162" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="111" y="152" rotation="0" clip_name="RopeRings"/>
		  <Object type="points_ghost" power="500" x="100" y="123" rotation="0" clip_name="PointsGhost500"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="595" y="167" rotation="0" clip_name="Screw"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="64" y="157" rotation="0" clip_name="Screw"/>
		  <Object scaleX="1" scaleY="1" width="44.95" height="42.55" type="frontground" x="96" y="403" rotation="0" clip_name="flower_3"/>
		  <Object scaleX="1" scaleY="1" width="27.55" height="35.7" type="frontground" x="404" y="406" rotation="0" clip_name="flower_0"/>
		  <Object scaleX="1" scaleY="1" width="27.65" height="18.1" type="frontground" x="583" y="427" rotation="0" clip_name="herb"/>
		  <Object type="sun" x="68" y="68" rotation="0" clip_name="States.PlayState::Sun"/>
		  <Object type="vulture" inverted="true" x="590" y="140" rotation="0" clip_name="InvertedVultureHere"/>
		  <Object type="cloud" x="175" y="16" rotation="0" clip_name="Cloud5"/>
		  <Object type="cloud" x="406" y="29" rotation="0" clip_name="Cloud6"/>
		  <Object type="cloud" x="626" y="46" rotation="0" clip_name="Cloud7"/>
		  <Object type="cloud" x="-101" y="33" rotation="0" clip_name="Cloud8"/>
		  <Object type="cloud" x="541" y="86" rotation="0" clip_name="Cloud9"/>
		  <Object x="0" y="0" rotation="0" clip_name="TeleportHint"/>
		</Level>;
        private static const LEVEL_7:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="Background"/>
		  <Object scaleX="1" scaleY="1" type="background" x="-1" y="357" rotation="0" clip_name="Back2"/>
		  <Object scaleX="1" scaleY="1" type="background" x="344" y="286" rotation="0" clip_name="tree_3"/>
		  <Object type="gibbet_obliquely" inverted="true" x="365" y="357" rotation="0" clip_name="InvertedGibbetObliquely"/>
		  <Object scaleX="1" scaleY="1" type="background" x="83" y="369" rotation="0" clip_name="tree_2"/>
		  <Object type="shooting_point" x="80" y="388" rotation="50.00074768066406" clip_name="BowPoint"/>
		  <Object type="gibbet" pers_id="2" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="328" y="345" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet" pers_id="3" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="324" y="227" rotation="0" clip_name="HangerPoint"/>
		  <Object type="static_box" is_stone="false" x="383" y="390" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="349" y="339" rotation="0" clip_name="GibbetStick"/>
		  <Object type="gibbet_obliquely" inverted="true" x="364" y="239" rotation="0" clip_name="InvertedGibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="383" y="274" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="349" y="222" rotation="0" clip_name="GibbetStick"/>
		  <Object type="ground" x="320" y="461" rotation="0" clip_name="Ground"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="316" y="216" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="320" y="334" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="382" y="222" rotation="0" clip_name="Screw"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="382" y="339" rotation="0" clip_name="Screw"/>
		  <Object type="sun" x="563" y="76" rotation="0" clip_name="States.PlayState::Sun"/>
		  <Object type="hedhehog_ghost" speed="0" charge="1" x="298" y="153" rotation="104.00003051757813" clip_name="ArrowGhost1"/>
		  <Object type="highlight" size="150" x="296" y="153" rotation="0" clip_name="ArrowGhostHint"/>
		  <Object type="gibbet" pers_id="1" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="558" y="264" rotation="0" clip_name="HangerPoint"/>
		  <Object type="static_box" is_stone="true" x="559" y="243" rotation="0" clip_name="Stone2"/>
		  <Object x="0" y="0" rotation="0" clip_name="ArrowGhostHint"/>
		  <Object type="points_ghost" power="500" x="560" y="193" rotation="0" clip_name="PointsGhost500"/>
		  <Object scaleX="1" scaleY="1" width="44.95" height="42.55" type="frontground" x="259" y="402" rotation="0" clip_name="flower_3"/>
		  <Object type="cloud" x="602" y="86" rotation="0" clip_name="Cloud7"/>
		  <Object type="cloud" x="193" y="42" rotation="0" clip_name="Cloud6"/>
		  <Object type="cloud" x="395" y="34" rotation="0" clip_name="Cloud5"/>
		  <Object type="cloud" x="57" y="63" rotation="0" clip_name="Cloud3"/>
		  <Object type="cloud" x="-138" y="32" rotation="0" clip_name="Cloud1"/>
		</Level>;
        private static const LEVEL_8:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="OvercastSky"/>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="344" rotation="0" clip_name="Back4"/>
		  <Object type="dynamic_box" x="345" y="431" rotation="0" clip_name="Box"/>
		  <Object type="shooting_point" x="568" y="366" rotation="-79.99894714355469" clip_name="BowPoint"/>
		  <Object type="gibbet" pers_id="3" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="125" y="345" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet" pers_id="1" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="136" y="227" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet_obliquely" inverted="false" x="100" y="355" rotation="0" clip_name="GibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="81" y="390" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="117" y="339" rotation="0" clip_name="GibbetStick"/>
		  <Object type="gibbet_obliquely" inverted="false" x="100" y="240" rotation="0" clip_name="GibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="81" y="274" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="117" y="222" rotation="0" clip_name="GibbetStick"/>
		  <Object scaleX="1" scaleY="1" type="background" x="189" y="235" rotation="0" clip_name="tree_10"/>
		  <Object type="ground" x="320" y="461" rotation="0" clip_name="Ground"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="128" y="216" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="117" y="334" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="81" y="222" rotation="0" clip_name="Screw"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="81" y="339" rotation="0" clip_name="Screw"/>
		  <Object type="cloud" x="418" y="49" rotation="0" clip_name="Cloud7"/>
		  <Object type="cloud" x="556" y="24" rotation="0" clip_name="Cloud6"/>
		  <Object type="cloud" x="180" y="22" rotation="0" clip_name="Cloud5"/>
		  <Object type="cloud" x="-111" y="10" rotation="0" clip_name="Cloud4"/>
		  <Object type="cloud" x="687" y="90" rotation="0" clip_name="Cloud9"/>
		  <Object type="dynamic_box" x="345" y="406" rotation="0" clip_name="Box"/>
		  <Object type="dynamic_box" x="345" y="381" rotation="0" clip_name="Box"/>
		  <Object type="dynamic_box" x="345" y="356" rotation="0" clip_name="Box"/>
		  <Object type="dynamic_box" x="345" y="330" rotation="0" clip_name="Box"/>
		  <Object type="points_ghost" power="300" x="87" y="185" rotation="0" clip_name="PointsGhost300"/>
		  <Object scaleX="1" scaleY="1" type="background" x="415" y="384" rotation="0" clip_name="BgStones"/>
		  <Object type="ammo_ghost" power="3" x="406" y="418" rotation="0" clip_name="AmmoGhost3"/>
		  <Object type="ammo_ghost" power="3" x="479" y="419" rotation="0" clip_name="AmmoGhost3"/>
		</Level>;
        private static const LEVEL_9:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="Background"/>
		  <Object scaleX="1" scaleY="1" type="background" x="-1" y="357" rotation="0" clip_name="Back2"/>
		  <Object type="static_box" is_stone="true" x="231" y="362" rotation="0" clip_name="ComposedStone2"/>
		  <Object type="static_box" is_stone="true" x="331" y="361" rotation="0" clip_name="ComposedStone2"/>
		  <Object type="shooting_point" x="33" y="417" rotation="20.000656127929688" clip_name="BowPoint"/>
		  <Object type="gibbet_obliquely" inverted="true" x="577" y="354" rotation="0" clip_name="InvertedGibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="596" y="388" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="gibbet" pers_id="3" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="541" y="343" rotation="0" clip_name="HangerPoint"/>
		  <Object type="static_box" is_stone="false" x="562" y="337" rotation="0" clip_name="GibbetStick"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="533" y="332" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="595" y="337" rotation="0" clip_name="Screw"/>
		  <Object type="static_box" is_stone="true" x="129" y="362" rotation="0" clip_name="ComposedStone2"/>
		  <Object type="static_box" is_stone="true" x="434" y="361" rotation="0" clip_name="ComposedStone2"/>
		  <Object type="ground" x="320" y="461" rotation="0" clip_name="Ground"/>
		  <Object type="sun" x="568" y="89" rotation="0" clip_name="States.PlayState::Sun"/>
		  <Object type="hedhehog_ghost" speed="0" charge="1" x="180" y="422" rotation="4.9994354248046875" clip_name="ArrowGhost1"/>
		  <Object type="hedhehog_ghost" speed="0" charge="1" x="281" y="423" rotation="5.00030517578125" clip_name="ArrowGhost1"/>
		  <Object type="hedhehog_ghost" speed="0" charge="1" x="384" y="423" rotation="3.9993743896484375" clip_name="ArrowGhost1"/>
		  <Object type="hedhehog_ghost" speed="0" charge="1" x="484" y="377" rotation="49.99922180175781" clip_name="ArrowGhost1"/>
		  <Object type="points_ghost" power="300" x="180" y="373" rotation="0" clip_name="PointsGhost300"/>
		  <Object type="points_ghost" power="300" x="180" y="322" rotation="0" clip_name="PointsGhost300"/>
		  <Object type="points_ghost" power="500" x="280" y="373" rotation="0" clip_name="PointsGhost500"/>
		  <Object type="points_ghost" power="500" x="280" y="323" rotation="0" clip_name="PointsGhost500"/>
		  <Object type="points_ghost" power="1000" x="381" y="373" rotation="0" clip_name="PointsGhost1000"/>
		  <Object type="points_ghost" power="1000" x="381" y="324" rotation="0" clip_name="PointsGhost1000"/>
		  <Object type="points_ghost" power="1000" x="557" y="305" rotation="0" clip_name="PointsGhost1000"/>
		  <Object scaleX="1" scaleY="1" width="27.65" height="18.1" type="frontground" x="511" y="426" rotation="0" clip_name="herb"/>
		  <Object scaleX="1" scaleY="1" width="27.65" height="18.1" type="frontground" x="48" y="426" rotation="0" clip_name="herb"/>
		  <Object type="cloud" x="193" y="14" rotation="0" clip_name="Cloud9"/>
		  <Object type="cloud" x="74" y="63" rotation="0" clip_name="Cloud8"/>
		  <Object type="cloud" x="326" y="10" rotation="0" clip_name="Cloud7"/>
		  <Object type="cloud" x="409" y="50" rotation="0" clip_name="Cloud6"/>
		  <Object type="cloud" x="613" y="10" rotation="0" clip_name="Cloud5"/>
		  <Object type="cloud" x="-181" y="16" rotation="0" clip_name="Cloud4"/>
		</Level>;
        private static const LEVEL_30:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="Background"/>
		  <Object scaleX="1" scaleY="1" type="background" x="-14" y="285" rotation="0" clip_name="BonusGameBack"/>
		  <Object type="shooting_point" x="323" y="279" rotation="0" clip_name="BowPoint"/>
		  <Object type="gibbet" pers_id="1" path_to_hang="RIGHT_LOWER_LEG" connect_legs="true" chains_count="7" x="47" y="364" rotation="0" clip_name="HangerPoint"/>
		  <Object type="static_box" is_stone="true" x="443" y="198" rotation="0" clip_name="Brick"/>
		  <Object type="static_box" is_stone="true" x="200" y="198" rotation="0" clip_name="Brick"/>
		  <Object type="static_box" is_stone="true" x="47" y="344" rotation="0" clip_name="Stone0"/>
		  <Object type="gibbet" pers_id="2" path_to_hang="HEAD" connect_legs="false" chains_count="5" x="50" y="230" rotation="0" clip_name="HangerPoint"/>
		  <Object type="static_box" is_stone="true" x="49" y="210" rotation="0" clip_name="Stone1"/>
		  <Object type="gibbet" pers_id="3" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="50" y="90" rotation="0" clip_name="HangerPoint"/>
		  <Object type="static_box" is_stone="true" x="50" y="70" rotation="0" clip_name="Stone2"/>
		  <Object type="gibbet" pers_id="4" path_to_hang="LEFT_LOWER_LEG" connect_legs="true" chains_count="7" x="589" y="359" rotation="0" clip_name="HangerPoint"/>
		  <Object type="static_box" is_stone="true" x="590" y="339" rotation="0" clip_name="Stone3"/>
		  <Object type="gibbet" pers_id="1" path_to_hang="HEAD" connect_legs="false" chains_count="5" x="590" y="226" rotation="0" clip_name="HangerPoint"/>
		  <Object type="static_box" is_stone="true" x="590" y="206" rotation="0" clip_name="Stone1"/>
		  <Object type="gibbet" pers_id="2" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="589" y="85" rotation="0" clip_name="HangerPoint"/>
		  <Object type="static_box" is_stone="true" x="590" y="65" rotation="0" clip_name="Stone0"/>
		  <Object type="points_ghost" power="500" x="198" y="147" rotation="0" clip_name="PointsGhost500"/>
		  <Object type="points_ghost" power="500" x="440" y="147" rotation="0" clip_name="PointsGhost500"/>
		  <Object type="sun" x="320" y="82" rotation="0" clip_name="States.PlayState::Sun"/>
		  <Object type="cloud" x="-90" y="22" rotation="0" clip_name="Cloud0"/>
		  <Object type="cloud" x="615" y="49" rotation="0" clip_name="Cloud1"/>
		  <Object type="cloud" x="391" y="22" rotation="0" clip_name="Cloud8"/>
		  <Object type="cloud" x="150" y="61" rotation="0" clip_name="Cloud7"/>
		</Level>;
        private static const LEVEL_31:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="Background"/>
		  <Object scaleX="1" scaleY="1" type="background" x="-4" y="331" rotation="0" clip_name="Back1"/>
		  <Object type="static_box" is_stone="true" x="117" y="324" rotation="0" clip_name="ComposedStone55"/>
		  <Object type="static_box" is_stone="true" x="404" y="325" rotation="0" clip_name="ComposedStone55"/>
		  <Object type="ground" x="320" y="461" rotation="0" clip_name="Ground"/>
		  <Object type="gibbet" pers_id="2" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="561" y="317" rotation="0" clip_name="HangerPoint"/>
		  <Object type="shooting_point" x="48" y="416" rotation="14.999740600585938" clip_name="BowPoint"/>
		  <Object type="teleport_ghost" x="189" y="411" rotation="0" clip_name="States.PlayState::TeleportGhost"/>
		  <Object type="teleport_ghost" x="326" y="411" rotation="0" clip_name="States.PlayState::TeleportGhost"/>
		  <Object type="teleport_ghost" x="483" y="411" rotation="0" clip_name="States.PlayState::TeleportGhost"/>
		  <Object type="static_box" is_stone="true" x="256" y="367" rotation="0" clip_name="Stone0"/>
		  <Object type="static_box" is_stone="true" x="256" y="332" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="256" y="298" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="256" y="264" rotation="0" clip_name="Stone3"/>
		  <Object type="static_box" is_stone="true" x="256" y="229" rotation="0" clip_name="Stone0"/>
		  <Object type="static_box" is_stone="true" x="256" y="195" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="256" y="160" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="256" y="126" rotation="0" clip_name="Stone3"/>
		  <Object type="static_box" is_stone="true" x="528" y="297" rotation="0" clip_name="Stone0"/>
		  <Object type="static_box" is_stone="true" x="528" y="263" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="528" y="229" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="528" y="194" rotation="0" clip_name="Stone3"/>
		  <Object type="static_box" is_stone="true" x="528" y="160" rotation="0" clip_name="Stone0"/>
		  <Object type="static_box" is_stone="true" x="528" y="125" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="528" y="91" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="256" y="91" rotation="0" clip_name="Stone0"/>
		  <Object type="static_box" is_stone="true" x="256" y="57" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="290" y="57" rotation="0" clip_name="Stone3"/>
		  <Object type="static_box" is_stone="true" x="324" y="57" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="358" y="57" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="391" y="57" rotation="0" clip_name="Stone3"/>
		  <Object type="static_box" is_stone="true" x="425" y="57" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="460" y="57" rotation="0" clip_name="Stone3"/>
		  <Object type="static_box" is_stone="true" x="494" y="57" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="528" y="57" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="18" y="56" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="52" y="56" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="85" y="56" rotation="0" clip_name="Stone3"/>
		  <Object type="static_box" is_stone="true" x="119" y="56" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="154" y="56" rotation="0" clip_name="Stone3"/>
		  <Object type="static_box" is_stone="true" x="187" y="56" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="222" y="56" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="562" y="297" rotation="0" clip_name="Stone3"/>
		  <Object type="static_box" is_stone="true" x="595" y="297" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="630" y="297" rotation="0" clip_name="Stone2"/>
		  <Object type="points_ghost" power="1000" x="592" y="246" rotation="0" clip_name="PointsGhost1000"/>
		  <Object type="hedhehog_ghost" speed="0" charge="1" x="761" y="414" rotation="-9.999359130859375" clip_name="ArrowGhost1"/>
		  <Object type="points_ghost" power="1000" x="592" y="200" rotation="0" clip_name="PointsGhost1000"/>
		  <Object scaleX="1" scaleY="1" width="27.65" height="18.1" type="frontground" x="235" y="427" rotation="0" clip_name="herb"/>
		  <Object scaleX="1" scaleY="1" width="27.65" height="18.1" type="frontground" x="576" y="426" rotation="0" clip_name="herb"/>
		</Level>;
        private static const LEVEL_32:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="OvercastSky"/>
		  <Object type="cloud" x="-42" y="29" rotation="0" clip_name="Cloud5"/>
		  <Object scaleX="1" scaleY="1" type="background" x="-1" y="344" rotation="0" clip_name="Back4"/>
		  <Object scaleX="1" scaleY="1" type="background" x="413" y="268" rotation="0" clip_name="tree_9"/>
		  <Object scaleX="1" scaleY="1" type="background" x="58" y="233" rotation="0" clip_name="tree_10"/>
		  <Object type="static_box" is_stone="false" x="29" y="413" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="ground" x="320" y="461" rotation="0" clip_name="Ground"/>
		  <Object type="gibbet" pers_id="2" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="224" y="87" rotation="0" clip_name="HangerPoint"/>
		  <Object type="shooting_point" x="566" y="373" rotation="-44.99955749511719" clip_name="BowPoint"/>
		  <Object type="cloud" x="241" y="50" rotation="0" clip_name="Cloud4"/>
		  <Object type="gibbet" pers_id="3" path_to_hang="LEFT_LOWER_LEG" connect_legs="true" chains_count="7" x="301" y="87" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet" pers_id="4" path_to_hang="LEFT_LOWER_LEG" connect_legs="true" chains_count="8" x="380" y="87" rotation="0" clip_name="HangerPoint" cloud_name="UseYouForceLuke" cloud_prob="0.4"/>
		  <Object type="gibbet" pers_id="1" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="89" y="188" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet" pers_id="3" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="91" y="322" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet_obliquely" inverted="false" x="47" y="333" rotation="0" clip_name="GibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="64" y="316" rotation="0" clip_name="GibbetStick"/>
		  <Object type="gibbet_obliquely" inverted="false" x="47" y="199" rotation="0" clip_name="GibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="64" y="183" rotation="0" clip_name="GibbetStick"/>
		  <Object type="static_box" is_stone="false" x="29" y="233" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="29" y="354" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="242" y="82" rotation="0" clip_name="GibbetStick"/>
		  <Object type="static_box" is_stone="false" x="329" y="82" rotation="0" clip_name="GibbetStick"/>
		  <Object type="static_box" is_stone="false" x="414" y="82" rotation="0" clip_name="GibbetStick"/>
		  <Object type="cloud" x="510" y="14" rotation="0" clip_name="Cloud0"/>
		  <Object type="static_box" is_stone="false" x="502" y="82" rotation="0" clip_name="GibbetStick"/>
		  <Object type="static_box" is_stone="false" x="570" y="82" rotation="0" clip_name="GibbetStick"/>
		  <Object type="static_box" is_stone="false" x="595" y="82" rotation="0" clip_name="GibbetStick"/>
		  <Object type="teleport_ghost" x="48" y="121" rotation="0" clip_name="States.PlayState::TeleportGhost"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="81" y="177" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="83" y="311" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="216" y="77" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="293" y="77" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="372" y="77" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="28" y="316" rotation="0" clip_name="Screw"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="28" y="183" rotation="0" clip_name="Screw"/>
		  <Object scaleX="1" scaleY="1" type="background" x="230" y="384" rotation="0" clip_name="BgStones"/>
		  <Object scaleX="1" scaleY="1" width="26.8" height="37.35" type="frontground" x="586" y="402" rotation="0" clip_name="flower_6"/>
		  <Object type="cloud" x="700" y="71" rotation="0" clip_name="Cloud1"/>
		  <Object type="cloud" x="-189" y="64" rotation="0" clip_name="Cloud6"/>
		</Level>;
        private static const LEVEL_34:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="Background"/>
		  <Object scaleX="1" scaleY="1" type="background" x="-3" y="328" rotation="0" clip_name="Back1"/>
		  <Object type="shooting_point" x="494" y="138" rotation="-109.9998779296875" clip_name="BowPoint"/>
		  <Object scaleX="1" scaleY="1" type="background" x="499" y="351" rotation="0" clip_name="tree_1"/>
		  <Object scaleX="1" scaleY="1" type="background" x="295" y="253" rotation="0" clip_name="tree_8"/>
		  <Object type="ground" x="320" y="461" rotation="0" clip_name="Ground"/>
		  <Object type="gibbet" pers_id="1" path_to_hang="HEAD" connect_legs="false" chains_count="9" x="439" y="313" rotation="0" clip_name="HangerPoint"/>
		  <Object type="static_box" is_stone="true" x="439" y="293" rotation="0" clip_name="Stone1"/>
		  <Object type="gibbet" pers_id="4" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="60" y="349" rotation="0" clip_name="HangerPoint"/>
		  <Object type="static_box" is_stone="true" x="59" y="328" rotation="0" clip_name="Stone1"/>
		  <Object type="gibbet" pers_id="3" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="262" y="179" rotation="0" clip_name="HangerPoint"/>
		  <Object type="static_box" is_stone="true" x="263" y="159" rotation="0" clip_name="Stone1"/>
		  <Object type="gibbet" pers_id="2" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="55" y="179" rotation="0" clip_name="HangerPoint"/>
		  <Object type="static_box" is_stone="true" x="56" y="159" rotation="0" clip_name="Stone1"/>
		  <Object type="gibbet" pers_id="4" path_to_hang="HEAD" connect_legs="false" chains_count="9" x="588" y="270" rotation="0" clip_name="HangerPoint"/>
		  <Object type="static_box" is_stone="true" x="588" y="249" rotation="0" clip_name="Stone3"/>
		  <Object type="hedhehog_ghost" speed="90" charge="3" x="524" y="340" rotation="40.000274658203125" clip_name="ArrowGhost3"/>
		  <Object type="cow" inverted="false" x="150" y="320" rotation="0" clip_name="CowHere"/>
		  <Object scaleX="1" scaleY="1" width="27.65" height="18.1" type="frontground" x="48" y="426" rotation="0" clip_name="herb"/>
		  <Object type="cloud" x="576" y="63" rotation="0" clip_name="Cloud8"/>
		  <Object type="cloud" x="336" y="47" rotation="0" clip_name="Cloud5"/>
		  <Object type="cloud" x="178" y="28" rotation="0" clip_name="Cloud1"/>
		  <Object type="cloud" x="-184" y="59" rotation="0" clip_name="Cloud0"/>
		  <Object type="sun" x="73" y="72" rotation="0" clip_name="States.PlayState::Sun"/>
		</Level>;
        private static const LEVEL_35:XML = null;
        private static const LEVEL_36:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="Background"/>
		  <Object scaleX="1" scaleY="1" type="background" x="-1" y="357" rotation="0" clip_name="Back2"/>
		  <Object scaleX="1" scaleY="1" type="background" x="56" y="286" rotation="0" clip_name="tree_3"/>
		  <Object type="ground" x="320" y="461" rotation="0" clip_name="Ground"/>
		  <Object type="shooting_point" x="50" y="407" rotation="59.99946594238281" clip_name="BowPoint"/>
		  <Object type="cloud" x="586" y="21" rotation="0" clip_name="Cloud8"/>
		  <Object type="gibbet_obliquely" inverted="true" x="375" y="349" rotation="0" clip_name="InvertedGibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="393" y="384" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="359" y="332" rotation="0" clip_name="GibbetStick"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="331" y="327" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="393" y="332" rotation="0" clip_name="Screw"/>
		  <Object type="cloud" x="696" y="95" rotation="0" clip_name="Cloud9"/>
		  <Object type="cloud" x="435" y="17" rotation="0" clip_name="Cloud6"/>
		  <Object type="sun" x="77" y="78" rotation="0" clip_name="States.PlayState::Sun"/>
		  <Object type="cloud" x="-11" y="5" rotation="0" clip_name="Cloud5"/>
		  <Object type="cloud" x="-152" y="55" rotation="0" clip_name="Cloud3"/>
		  <Object type="cloud" x="153" y="104" rotation="0" clip_name="Cloud2"/>
		  <Object type="cloud" x="236" y="11" rotation="0" clip_name="Cloud1"/>
		  <Object type="gibbet" pers_id="3" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="338" y="338" rotation="0" clip_name="HangerPoint"/>
		  <Object type="ammo_ghost" power="10" x="584" y="414" rotation="0" clip_name="AmmoGhost10"/>
		  <Object type="tnt_barrel" x="522" y="374" rotation="0" clip_name="States.PlayState::TNTBarrel"/>
		  <Object type="tnt_barrel" x="522" y="332" rotation="0" clip_name="States.PlayState::TNTBarrel"/>
		  <Object type="dynamic_box" x="523" y="434" rotation="0" clip_name="Box"/>
		  <Object type="dynamic_box" x="523" y="409" rotation="0" clip_name="Box"/>
		  <Object type="dynamic_box" x="523" y="299" rotation="0" clip_name="Box"/>
		  <Object type="dynamic_box" x="523" y="274" rotation="0" clip_name="Box"/>
		  <Object type="static_box" is_stone="true" x="593" y="99" rotation="0" clip_name="Stone0"/>
		  <Object type="static_box" is_stone="true" x="454" y="99" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="325" y="101" rotation="0" clip_name="Stone3"/>
		  <Object type="static_box" is_stone="true" x="197" y="101" rotation="0" clip_name="Stone2"/>
		  <Object type="gibbet" pers_id="4" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="197" y="122" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet" pers_id="1" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="325" y="122" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet" pers_id="2" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="454" y="119" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet" pers_id="2" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="594" y="120" rotation="0" clip_name="HangerPoint"/>
		  <Object type="points_ghost" power="300" x="197" y="51" rotation="0" clip_name="PointsGhost300"/>
		  <Object type="points_ghost" power="500" x="324" y="51" rotation="0" clip_name="PointsGhost500"/>
		  <Object scaleX="1" scaleY="1" width="27.65" height="18.1" type="frontground" x="435" y="425" rotation="0" clip_name="herb"/>
		  <Object type="vulture" inverted="true" x="463" y="64" rotation="0" clip_name="InvertedVultureHere"/>
		</Level>;
        private static const LEVEL_37:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="Background"/>
		  <Object scaleX="1" scaleY="1" type="background" x="-2" y="352" rotation="0" clip_name="Back3"/>
		  <Object type="static_box" is_stone="false" x="626" y="385" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="ground" x="320" y="461" rotation="0" clip_name="Ground"/>
		  <Object type="gibbet" pers_id="4" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="574" y="266" rotation="0" clip_name="HangerPoint"/>
		  <Object type="shooting_point" x="116" y="336" rotation="59.99946594238281" clip_name="BowPoint"/>
		  <Object type="gibbet" pers_id="3" path_to_hang="RIGHT_LOWER_LEG" connect_legs="true" chains_count="7" x="532" y="197" rotation="0" clip_name="HangerPoint" cloud_name="ILikeToHangCloud" cloud_prob="0.3"/>
		  <Object type="gibbet_obliquely" inverted="true" x="608" y="209" rotation="0" clip_name="InvertedGibbetObliquely"/>
		  <Object type="gibbet_obliquely" inverted="true" x="609" y="279" rotation="0" clip_name="InvertedGibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="626" y="264" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="626" y="146" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="592" y="192" rotation="0" clip_name="GibbetStick"/>
		  <Object type="static_box" is_stone="false" x="555" y="192" rotation="0" clip_name="GibbetStick"/>
		  <Object type="static_box" is_stone="false" x="591" y="263" rotation="0" clip_name="GibbetStick"/>
		  <Object type="gibbet" pers_id="2" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="571" y="77" rotation="0" clip_name="HangerPoint"/>
		  <Object type="cloud" x="519" y="35" rotation="0" clip_name="Cloud8"/>
		  <Object type="gibbet_obliquely" inverted="true" x="608" y="91" rotation="0" clip_name="InvertedGibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="626" y="125" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="592" y="73" rotation="0" clip_name="GibbetStick"/>
		  <Object scaleX="1" scaleY="1" type="background" x="302" y="192" rotation="0" clip_name="Mill"/>
		  <Object type="rotor" speed="55" scaleX="0.8499908447265625" scaleY="0.8499908447265625" x="359" y="238" rotation="0" clip_name="MillFan"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="564" y="68" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="525" y="186" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="567" y="258" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="626" y="262" rotation="0" clip_name="Screw"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="626" y="192" rotation="0" clip_name="Screw"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="626" y="73" rotation="0" clip_name="Screw"/>
		  <Object type="sun" x="107" y="76" rotation="0" clip_name="States.PlayState::Sun"/>
		  <Object scaleX="1" scaleY="1" width="27.65" height="18.1" type="frontground" x="477" y="427" rotation="0" clip_name="herb"/>
		  <Object scaleX="1" scaleY="1" type="background" x="18" y="368" rotation="0" clip_name="tree_2"/>
		  <Object type="cloud" x="696" y="95" rotation="0" clip_name="Cloud9"/>
		  <Object type="cloud" x="385" y="92" rotation="0" clip_name="Cloud6"/>
		  <Object type="cloud" x="-11" y="5" rotation="0" clip_name="Cloud5"/>
		  <Object type="cloud" x="-152" y="55" rotation="0" clip_name="Cloud3"/>
		  <Object type="cloud" x="153" y="104" rotation="0" clip_name="Cloud2"/>
		  <Object type="cloud" x="236" y="11" rotation="0" clip_name="Cloud1"/>
		  <Object type="cow" inverted="true" x="379" y="321" rotation="0" clip_name="InvertedCowHere"/>
		</Level>;
        private static const LEVEL_38:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="OvercastSky"/>
		  <Object type="gibbet_obliquely" inverted="false" x="391" y="236" rotation="0" clip_name="GibbetObliquely"/>
		  <Object type="gibbet" pers_id="1" path_to_hang="HEAD" connect_legs="false" chains_count="10" x="62" y="271" rotation="0" clip_name="HangerPoint"/>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="337" rotation="0" clip_name="Back4"/>
		  <Object scaleX="1" scaleY="1" type="background" x="112" y="234" rotation="0" clip_name="tree_10"/>
		  <Object type="shooting_point" x="590" y="417" rotation="-45" clip_name="BowPoint"/>
		  <Object type="hedhehog_ghost" speed="50" charge="3" x="225" y="200" rotation="0" clip_name="ArrowGhost3"/>
		  <Object type="gibbet" pers_id="2" path_to_hang="HEAD" connect_legs="false" chains_count="9" x="135" y="237" rotation="0" clip_name="HangerPoint"/>
		  <Object type="static_box" is_stone="true" x="128" y="216" rotation="0" clip_name="Stone0"/>
		  <Object type="static_box" is_stone="true" x="94" y="216" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="60" y="216" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="60" y="250" rotation="0" clip_name="Stone3"/>
		  <Object type="ground" x="320" y="461" rotation="0" clip_name="Ground"/>
		  <Object type="gibbet_obliquely" inverted="true" x="348" y="236" rotation="0" clip_name="InvertedGibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="370" y="269" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="gibbet_ground" x="371" y="360" rotation="0" clip_name="GibbetGround"/>
		  <Object type="gibbet" pers_id="3" path_to_hang="HEAD" connect_legs="false" chains_count="8" x="308" y="223" rotation="0" clip_name="HangerPoint"/>
		  <Object type="static_box" is_stone="false" x="340" y="219" rotation="0" clip_name="GibbetStick"/>
		  <Object type="gibbet" pers_id="4" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="432" y="223" rotation="0" clip_name="HangerPoint"/>
		  <Object type="static_box" is_stone="false" x="400" y="219" rotation="0" clip_name="GibbetStick"/>
		  <Object type="static_box" is_stone="true" x="518" y="328" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="518" y="362" rotation="0" clip_name="Stone3"/>
		  <Object type="static_box" is_stone="true" x="518" y="260" rotation="0" clip_name="Stone0"/>
		  <Object type="static_box" is_stone="true" x="518" y="294" rotation="0" clip_name="Stone3"/>
		  <Object type="hedhehog_ghost" speed="-70" charge="3" x="583" y="190" rotation="0" clip_name="ArrowGhost3"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="424" y="214" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="300" y="214" rotation="0" clip_name="RopeRings"/>
		  <Object type="teleport_ghost" x="225" y="410" rotation="0" clip_name="States.PlayState::TeleportGhost"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="369" y="219" rotation="0" clip_name="Screw"/>
		  <Object type="points_ghost" power="1000" x="337" y="187" rotation="0" clip_name="PointsGhost1000"/>
		  <Object type="points_ghost" power="1000" x="404" y="187" rotation="0" clip_name="PointsGhost1000"/>
		  <Object scaleX="1" scaleY="1" width="50.85" height="25.2" type="frontground" x="289" y="420" rotation="0" clip_name="flower_5"/>
		  <Object scaleX="1" scaleY="1" width="26.8" height="37.35" type="frontground" x="465" y="404" rotation="0" clip_name="flower_6"/>
		  <Object type="cloud" x="-137" y="23" rotation="0" clip_name="Cloud0"/>
		  <Object type="cloud" x="78" y="12" rotation="0" clip_name="Cloud1"/>
		  <Object type="cloud" x="275" y="72" rotation="0" clip_name="Cloud2"/>
		  <Object type="cloud" x="396" y="19" rotation="0" clip_name="Cloud3"/>
		  <Object type="cloud" x="560" y="34" rotation="0" clip_name="Cloud4"/>
		  <Object type="vulture" inverted="true" x="52" y="179" rotation="0" clip_name="InvertedVultureHere"/>
		</Level>;
        private static const LEVEL_39:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="Background"/>
		  <Object type="gibbet_obliquely" inverted="false" x="76" y="222" rotation="0" clip_name="GibbetObliquely"/>
		  <Object scaleX="1" scaleY="1" type="background" x="-3" y="351" rotation="0" clip_name="Back3"/>
		  <Object type="shooting_point" x="551" y="391" rotation="-44.99955749511719" clip_name="BowPoint"/>
		  <Object type="static_box" is_stone="false" x="58" y="420" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="gibbet_obliquely" inverted="false" x="76" y="347" rotation="0" clip_name="GibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="58" y="301" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="92" y="331" rotation="0" clip_name="GibbetStick"/>
		  <Object type="static_box" is_stone="false" x="58" y="181" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="gibbet_obliquely" inverted="false" x="76" y="109" rotation="0" clip_name="GibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="58" y="141" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="93" y="204" rotation="0" clip_name="GibbetStick"/>
		  <Object type="gibbet" pers_id="1" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="106" y="210" rotation="0" clip_name="HangerPoint"/>
		  <Object type="static_box" is_stone="false" x="92" y="91" rotation="0" clip_name="GibbetStick"/>
		  <Object type="static_box" is_stone="false" x="182" y="331" rotation="0" clip_name="GibbetStick"/>
		  <Object type="static_box" is_stone="false" x="268" y="331" rotation="0" clip_name="GibbetStick"/>
		  <Object type="gibbet" pers_id="2" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="106" y="95" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet" pers_id="3" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="106" y="337" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet" pers_id="4" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="183" y="337" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet" pers_id="1" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="260" y="337" rotation="0" clip_name="HangerPoint"/>
		  <Object scaleX="0.8947296142578125" scaleY="0.8947296142578125" type="background" x="518" y="273" rotation="0" clip_name="tree_8"/>
		  <Object scaleX="0.7641754150390625" scaleY="0.7641754150390625" type="background" x="285" y="373" rotation="0" clip_name="tree_1"/>
		  <Object type="ground" x="320" y="461" rotation="0" clip_name="Ground"/>
		  <Object scaleX="0.786407470703125" scaleY="0.786407470703125" width="22.3" height="28.75" type="frontground" x="133" y="408" rotation="0" clip_name="flower_4"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="252" y="326" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="175" y="326" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="98" y="326" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="98" y="199" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="98" y="86" rotation="0" clip_name="RopeRings"/>
		  <Object type="static_box" is_stone="true" x="438" y="265" rotation="0" clip_name="Stone0"/>
		  <Object type="static_box" is_stone="true" x="472" y="265" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="506" y="265" rotation="0" clip_name="Stone2"/>
		  <Object type="sun" x="567" y="73" rotation="0" clip_name="States.PlayState::Sun"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="57" y="331" rotation="0" clip_name="Screw"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="57" y="204" rotation="0" clip_name="Screw"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="58" y="91" rotation="0" clip_name="Screw"/>
		  <Object type="ammo_ghost" power="3" x="458" y="222" rotation="0" clip_name="AmmoGhost3"/>
		  <Object scaleX="0.7081451416015625" scaleY="0.7081451416015625" width="19.5" height="25.3" type="frontground" x="457" y="417" rotation="0" clip_name="flower_0"/>
		  <Object type="cloud" x="201" y="19" rotation="0" clip_name="Cloud0"/>
		  <Object type="cloud" x="387" y="114" rotation="0" clip_name="Cloud9"/>
		  <Object type="cloud" x="30" y="18" rotation="0" clip_name="Cloud8"/>
		  <Object type="cloud" x="407" y="14" rotation="0" clip_name="Cloud7"/>
		  <Object type="cloud" x="113" y="109" rotation="0" clip_name="Cloud2"/>
		  <Object type="cloud" x="472" y="64" rotation="0" clip_name="Cloud1"/>
		</Level>;
        private static const LEVEL_33:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="Background"/>
		  <Object scaleX="1" scaleY="1" type="background" x="-9" y="280" rotation="0" clip_name="BonusGameBack"/>
		  <Object type="gibbet_obliquely" inverted="true" x="560" y="184" rotation="0" clip_name="InvertedGibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="579" y="218" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="gibbet" pers_id="3" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="524" y="173" rotation="0" clip_name="HangerPoint"/>
		  <Object type="shooting_point" x="452" y="392" rotation="-19.999099731445313" clip_name="BowPoint"/>
		  <Object type="dynamic_box" x="341" y="431" rotation="0" clip_name="Box"/>
		  <Object type="dynamic_box" x="341" y="406" rotation="0" clip_name="Box"/>
		  <Object type="dynamic_box" x="341" y="381" rotation="0" clip_name="Box"/>
		  <Object type="dynamic_box" x="341" y="356" rotation="0" clip_name="Box"/>
		  <Object type="dynamic_box" x="341" y="331" rotation="0" clip_name="Box"/>
		  <Object type="dynamic_box" x="341" y="306" rotation="0" clip_name="Box"/>
		  <Object type="gibbet_ground" x="539" y="312" rotation="0" clip_name="GibbetGround"/>
		  <Object type="static_box" is_stone="false" x="545" y="167" rotation="0" clip_name="GibbetStick"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="578" y="167" rotation="0" clip_name="Screw"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="516" y="162" rotation="0" clip_name="RopeRings"/>
		  <Object type="static_box" is_stone="true" x="350" y="281" rotation="0" clip_name="Brick"/>
		  <Object type="tnt_barrel" x="283" y="369" rotation="0" clip_name="States.PlayState::TNTBarrel"/>
		  <Object type="static_box" is_stone="true" x="333" y="459" rotation="0" clip_name="Brick"/>
		  <Object type="static_box" is_stone="true" x="281" y="404" rotation="0" clip_name="Brick"/>
		  <Object type="hedhehog_ghost" speed="0" charge="1" x="192" y="313" rotation="49.999725341796875" clip_name="ArrowGhost1"/>
		  <Object type="gibbet_obliquely" inverted="false" x="80" y="293" rotation="0" clip_name="GibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="61" y="326" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="gibbet" pers_id="2" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="109" y="280" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet_ground" x="89" y="420" rotation="0" clip_name="GibbetGround"/>
		  <Object type="static_box" is_stone="false" x="95" y="275" rotation="0" clip_name="GibbetStick"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="102" y="269" rotation="0" clip_name="RopeRings"/>
		  <Object type="gibbet_obliquely" inverted="false" x="79" y="179" rotation="0" clip_name="GibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="61" y="211" rotation="0" clip_name="GibbetColumn"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="61" y="275" rotation="0" clip_name="Screw"/>
		  <Object type="sun" x="76" y="85" rotation="0" clip_name="States.PlayState::Sun"/>
		  <Object type="points_ghost" power="500" x="550" y="133" rotation="0" clip_name="PointsGhost500"/>
		  <Object type="cloud" x="548" y="54" rotation="0" clip_name="Cloud6"/>
		  <Object type="cloud" x="310" y="109" rotation="0" clip_name="Cloud8"/>
		  <Object type="cloud" x="99" y="27" rotation="0" clip_name="Cloud9"/>
		  <Object type="cloud" x="123" y="67" rotation="0" clip_name="Cloud1"/>
		  <Object type="cloud" x="412" y="29" rotation="0" clip_name="Cloud2"/>
		  <Object type="cloud" x="-187" y="44" rotation="0" clip_name="Cloud4"/>
		  <Object type="gibbet" pers_id="2" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="110" y="166" rotation="0" clip_name="HangerPoint"/>
		  <Object type="static_box" is_stone="false" x="95" y="161" rotation="0" clip_name="GibbetStick"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="102" y="155" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="61" y="161" rotation="0" clip_name="Screw"/>
		</Level>;
        private static const LEVEL_44:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="Background"/>
		  <Object type="shooting_point" x="613" y="99" rotation="-119.9998779296875" clip_name="BowPoint"/>
		  <Object type="gibbet" pers_id="1" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="166" y="274" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet" pers_id="3" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="322" y="380" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet" pers_id="3" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="483" y="259" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet" pers_id="4" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="69" y="149" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet" pers_id="4" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="278" y="170" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet" pers_id="1" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="73" y="380" rotation="0" clip_name="HangerPoint"/>
		  <Object type="static_box" is_stone="true" x="482" y="240" rotation="0" clip_name="Stone0"/>
		  <Object type="static_box" is_stone="true" x="321" y="360" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="72" y="360" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="166" y="254" rotation="0" clip_name="Stone3"/>
		  <Object type="static_box" is_stone="true" x="277" y="151" rotation="0" clip_name="Stone0"/>
		  <Object type="static_box" is_stone="true" x="68" y="129" rotation="0" clip_name="Stone2"/>
		  <Object scaleX="1" scaleY="1" type="background" x="-6" y="280" rotation="0" clip_name="BonusGameBack"/>
		  <Object type="teleport_ghost" x="601" y="246" rotation="0" clip_name="States.PlayState::TeleportGhost"/>
		  <Object type="points_ghost" power="500" x="66" y="84" rotation="0" clip_name="PointsGhost500"/>
		  <Object type="points_ghost" power="500" x="321" y="310" rotation="0" clip_name="PointsGhost500"/>
		  <Object type="vulture" inverted="false" x="271" y="114" rotation="0" clip_name="VultureHere"/>
		  <Object type="vulture" inverted="true" x="490" y="206" rotation="0" clip_name="InvertedVultureHere"/>
		  <Object type="vulture" inverted="false" x="66" y="323" rotation="0" clip_name="VultureHere"/>
		  <Object type="cloud" x="286" y="6" rotation="0" clip_name="Cloud0"/>
		  <Object type="cloud" x="599" y="25" rotation="0" clip_name="Cloud1"/>
		  <Object type="cloud" x="-114" y="6" rotation="0" clip_name="Cloud5"/>
		  <Object type="cloud" x="99" y="64" rotation="0" clip_name="Cloud6"/>
		  <Object type="cloud" x="504" y="93" rotation="0" clip_name="Cloud9"/>
		</Level>;
        private static const LEVEL_42:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="Background"/>
		  <Object type="sun" x="77" y="80" rotation="0" clip_name="States.PlayState::Sun"/>
		  <Object scaleX="1" scaleY="1" type="background" x="-3" y="352" rotation="0" clip_name="Back3"/>
		  <Object type="static_box" is_stone="true" x="84" y="427" rotation="0" clip_name="Stone0"/>
		  <Object type="static_box" is_stone="true" x="84" y="392" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="84" y="358" rotation="0" clip_name="Stone2"/>
		  <Object type="shooting_point" x="323" y="319" rotation="0" clip_name="BowPoint"/>
		  <Object scaleX="1" scaleY="1" type="background" x="496" y="254" rotation="0" clip_name="tree_8"/>
		  <Object type="ground" x="320" y="461" rotation="0" clip_name="Ground"/>
		  <Object type="static_box" is_stone="false" x="240" y="118" rotation="45" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="324" y="-23" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="281" y="76" rotation="45" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="411" y="120" rotation="-45" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="363" y="72" rotation="-45" clip_name="GibbetColumn"/>
		  <Object type="gibbet" pers_id="1" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="206" y="161" rotation="0" clip_name="HangerPoint"/>
		  <Object type="cloud" x="554" y="36" rotation="0" clip_name="Cloud2"/>
		  <Object type="gibbet" pers_id="2" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="261" y="106" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet" pers_id="3" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="383" y="103" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet" pers_id="4" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="443" y="161" rotation="0" clip_name="HangerPoint"/>
		  <Object type="static_box" is_stone="true" x="187" y="426" rotation="0" clip_name="Stone0"/>
		  <Object type="static_box" is_stone="true" x="187" y="392" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="187" y="358" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="471" y="426" rotation="0" clip_name="Stone0"/>
		  <Object type="static_box" is_stone="true" x="471" y="392" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="471" y="358" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="471" y="323" rotation="0" clip_name="Stone3"/>
		  <Object type="static_box" is_stone="true" x="471" y="289" rotation="0" clip_name="Stone0"/>
		  <Object type="static_box" is_stone="true" x="471" y="255" rotation="0" clip_name="Stone1"/>
		  <Object type="points_ghost" power="1000" x="589" y="408" rotation="0" clip_name="PointsGhost1000"/>
		  <Object type="static_box" is_stone="true" x="153" y="358" rotation="0" clip_name="Stone3"/>
		  <Object type="static_box" is_stone="true" x="118" y="358" rotation="0" clip_name="Stone2"/>
		  <Object type="points_ghost" power="1000" x="32" y="414" rotation="0" clip_name="PointsGhost1000"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="324" y="34" rotation="0" clip_name="Screw"/>
		  <Object scaleX="1.0000010787037903" scaleY="1.0000010787037903" width="18.9" height="18.9" type="frontground" x="444" y="145" rotation="45" clip_name="RopeRings"/>
		  <Object scaleX="1.0000010787037903" scaleY="1.0000010787037903" width="18.9" height="18.9" type="frontground" x="385" y="87" rotation="45" clip_name="RopeRings"/>
		  <Object scaleX="0.9999794995173527" scaleY="0.9999794995173527" width="18.9" height="18.9" type="frontground" x="194" y="156" rotation="-45" clip_name="RopeRings"/>
		  <Object scaleX="0.9999794995173527" scaleY="0.9999794995173527" width="18.9" height="18.9" type="frontground" x="249" y="100" rotation="-45" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="27.65" height="18.1" type="frontground" x="118" y="426" rotation="0" clip_name="herb"/>
		  <Object type="cloud" x="383" y="43" rotation="0" clip_name="Cloud6"/>
		  <Object type="cloud" x="106" y="17" rotation="0" clip_name="Cloud5"/>
		  <Object type="cloud" x="-175" y="51" rotation="0" clip_name="Cloud4"/>
		  <Object type="cloud" x="665" y="59" rotation="0" clip_name="Cloud1"/>
		</Level>;
        private static const LEVEL_46:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="Background"/>
		  <Object scaleX="1" scaleY="1" type="background" x="-1" y="357" rotation="0" clip_name="Back2"/>
		  <Object type="shooting_point" x="81" y="408" rotation="40.00077819824219" clip_name="BowPoint"/>
		  <Object type="gibbet" pers_id="1" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="542" y="326" rotation="0" clip_name="HangerPoint"/>
		  <Object type="ground" x="320" y="461" rotation="0" clip_name="Ground"/>
		  <Object scaleX="1" scaleY="1" type="background" x="284" y="367" rotation="0" clip_name="tree_2"/>
		  <Object type="hedhehog_ghost" speed="0" charge="1" x="135" y="358" rotation="0" clip_name="ArrowGhost1"/>
		  <Object type="hedhehog_ghost" speed="0" charge="1" x="198" y="331" rotation="0" clip_name="ArrowGhost1"/>
		  <Object type="hedhehog_ghost" speed="0" charge="1" x="266" y="311" rotation="0" clip_name="ArrowGhost1"/>
		  <Object type="hedhehog_ghost" speed="0" charge="1" x="482" y="331" rotation="0" clip_name="ArrowGhost1"/>
		  <Object type="hedhehog_ghost" speed="0" charge="1" x="343" y="307" rotation="0" clip_name="ArrowGhost1"/>
		  <Object type="hedhehog_ghost" speed="0" charge="1" x="416" y="314" rotation="0" clip_name="ArrowGhost1"/>
		  <Object type="points_ghost" power="300" x="131" y="127" rotation="0" clip_name="PointsGhost300"/>
		  <Object type="points_ghost" power="500" x="192" y="181" rotation="0" clip_name="PointsGhost500"/>
		  <Object type="points_ghost" power="1000" x="266" y="123" rotation="0" clip_name="PointsGhost1000"/>
		  <Object type="points_ghost" power="300" x="340" y="175" rotation="0" clip_name="PointsGhost300"/>
		  <Object type="points_ghost" power="500" x="415" y="127" rotation="0" clip_name="PointsGhost500"/>
		  <Object type="points_ghost" power="1000" x="482" y="178" rotation="0" clip_name="PointsGhost1000"/>
		  <Object type="static_box" is_stone="true" x="543" y="305" rotation="0" clip_name="Stone3"/>
		  <Object type="points_ghost" power="500" x="605" y="398" rotation="0" clip_name="PointsGhost500"/>
		  <Object type="sun" x="559" y="81" rotation="0" clip_name="States.PlayState::Sun"/>
		  <Object type="vulture" inverted="true" x="550" y="270" rotation="0" clip_name="InvertedVultureHere"/>
		  <Object scaleX="1" scaleY="1" width="27.65" height="18.1" type="frontground" x="112" y="427" rotation="0" clip_name="herb"/>
		  <Object scaleX="1" scaleY="1" width="27.65" height="18.1" type="frontground" x="479" y="428" rotation="0" clip_name="herb"/>
		  <Object type="cloud" x="-45" y="79" rotation="0" clip_name="Cloud7"/>
		  <Object type="cloud" x="142" y="33" rotation="0" clip_name="Cloud6"/>
		  <Object type="cloud" x="321" y="57" rotation="0" clip_name="Cloud5"/>
		  <Object type="cloud" x="542" y="55" rotation="0" clip_name="Cloud4"/>
		</Level>;
        private static const LEVEL_47:XML = null;
        private static const LEVEL_48:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="StarrySky"/>
		  <Object type="gibbet_obliquely" inverted="false" x="100" y="78" rotation="0" clip_name="GibbetObliquely"/>
		  <Object type="gibbet" pers_id="2" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="129" y="65" rotation="0" clip_name="HangerPoint"/>
		  <Object type="shooting_point" x="61" y="384" rotation="84.99969482421875" clip_name="BowPoint"/>
		  <Object type="cloud" x="248" y="418" rotation="0" clip_name="Cloud0"/>
		  <Object type="cloud" x="639" y="431" rotation="0" clip_name="Cloud3"/>
		  <Object type="cloud" x="384" y="357" rotation="0" clip_name="Cloud7"/>
		  <Object type="cloud" x="-127" y="374" rotation="0" clip_name="Cloud8"/>
		  <Object type="cloud" x="73" y="433" rotation="0" clip_name="Cloud7"/>
		  <Object type="static_box" is_stone="true" x="389" y="412" rotation="0" clip_name="ComposedStone96"/>
		  <Object type="static_box" is_stone="true" x="252" y="338" rotation="0" clip_name="ComposedStone96"/>
		  <Object type="static_box" is_stone="true" x="389" y="261" rotation="0" clip_name="ComposedStone96"/>
		  <Object type="static_box" is_stone="false" x="82" y="111" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="true" x="252" y="186" rotation="0" clip_name="ComposedStone96"/>
		  <Object type="static_box" is_stone="true" x="464" y="112" rotation="0" clip_name="ComposedStone96"/>
		  <Object type="tnt_barrel" x="454" y="376" rotation="0" clip_name="States.PlayState::TNTBarrel"/>
		  <Object type="tnt_barrel" x="222" y="300" rotation="0" clip_name="States.PlayState::TNTBarrel"/>
		  <Object type="teleport_ghost" x="560" y="367" rotation="0" clip_name="States.PlayState::TeleportGhost"/>
		  <Object type="teleport_ghost" x="560" y="303" rotation="0" clip_name="States.PlayState::TeleportGhost"/>
		  <Object type="teleport_ghost" x="113" y="298" rotation="0" clip_name="States.PlayState::TeleportGhost"/>
		  <Object type="teleport_ghost" x="115" y="225" rotation="0" clip_name="States.PlayState::TeleportGhost"/>
		  <Object type="tnt_barrel" x="453" y="225" rotation="0" clip_name="States.PlayState::TNTBarrel"/>
		  <Object type="teleport_ghost" x="557" y="217" rotation="0" clip_name="States.PlayState::TeleportGhost"/>
		  <Object type="teleport_ghost" x="557" y="153" rotation="0" clip_name="States.PlayState::TeleportGhost"/>
		  <Object type="tnt_barrel" x="265" y="149" rotation="0" clip_name="States.PlayState::TNTBarrel"/>
		  <Object type="teleport_ghost" x="190" y="142" rotation="0" clip_name="States.PlayState::TeleportGhost"/>
		  <Object type="static_box" is_stone="false" x="117" y="60" rotation="0" clip_name="GibbetStick"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="122" y="55" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="82" y="60" rotation="0" clip_name="Screw"/>
		  <Object type="tnt_barrel" x="222" y="375" rotation="0" clip_name="States.PlayState::TNTBarrel"/>
		</Level>;
        private static const LEVEL_43:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="OvercastSky"/>
		  <Object type="gibbet" pers_id="2" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="249" y="151" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet" pers_id="3" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="562" y="341" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet_obliquely" inverted="true" x="602" y="353" rotation="0" clip_name="InvertedGibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="621" y="388" rotation="0" clip_name="GibbetColumn"/>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="337" rotation="0" clip_name="Back4"/>
		  <Object scaleX="0.8017730712890625" scaleY="0.8017730712890625" type="background" x="8" y="302" rotation="0" clip_name="tree_9"/>
		  <Object type="shooting_point" x="148" y="353" rotation="59.99946594238281" clip_name="BowPoint"/>
		  <Object type="static_box" is_stone="false" x="585" y="335" rotation="0" clip_name="GibbetStick"/>
		  <Object scaleX="1" scaleY="1" type="background" x="318" y="382" rotation="0" clip_name="BgStones"/>
		  <Object scaleX="1" scaleY="1" width="26.8" height="37.35" type="frontground" x="451" y="401" rotation="0" clip_name="flower_6"/>
		  <Object type="ground" x="320" y="461" rotation="0" clip_name="Ground"/>
		  <Object type="hedhehog_ghost" speed="-40" charge="3" x="497" y="285" rotation="0" clip_name="ArrowGhost3"/>
		  <Object type="gibbet_obliquely" inverted="true" x="288" y="162" rotation="0" clip_name="InvertedGibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="306" y="197" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="271" y="144" rotation="0" clip_name="GibbetStick"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="554" y="330" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="241" y="139" rotation="0" clip_name="RopeRings"/>
		  <Object type="gibbet" pers_id="1" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="330" y="294" rotation="0" clip_name="HangerPoint"/>
		  <Object type="cloud" x="325" y="23" rotation="0" clip_name="Cloud4"/>
		  <Object type="cloud" x="206" y="89" rotation="0" clip_name="Cloud7"/>
		  <Object type="cloud" x="40" y="38" rotation="0" clip_name="Cloud8"/>
		  <Object type="hedhehog_ghost" speed="0" charge="1" x="70" y="145" rotation="89.9947509765625" clip_name="ArrowGhost1"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="305" y="145" rotation="0" clip_name="Screw"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="621" y="335" rotation="0" clip_name="Screw"/>
		  <Object type="static_box" is_stone="true" x="170" y="274" rotation="0" clip_name="ComposedStone99"/>
		  <Object type="cloud" x="630" y="61" rotation="0" clip_name="Cloud6"/>
		  <Object type="cloud" x="-196" y="32" rotation="0" clip_name="Cloud0"/>
		</Level>;
        private static const LEVEL_45:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="OvercastSky"/>
		  <Object scaleX="1" scaleY="1" type="background" x="-1" y="346" rotation="0" clip_name="Back4"/>
		  <Object scaleX="1" scaleY="1" type="background" x="375" y="268" rotation="0" clip_name="tree_9"/>
		  <Object type="shooting_point" x="551" y="323" rotation="-49.999725341796875" clip_name="BowPoint"/>
		  <Object type="gibbet_obliquely" inverted="false" x="71" y="336" rotation="0" clip_name="GibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="53" y="387" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="gibbet" pers_id="3" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="107" y="324" rotation="0" clip_name="HangerPoint" cloud_name="HeadShotCloud" cloud_prob="0.3"/>
		  <Object type="static_box" is_stone="false" x="53" y="270" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="87" y="320" rotation="0" clip_name="GibbetStick"/>
		  <Object type="gibbet" pers_id="3" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="105" y="149" rotation="0" clip_name="HangerPoint"/>
		  <Object type="static_box" is_stone="false" x="251" y="395" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="gibbet_obliquely" inverted="false" x="269" y="345" rotation="0" clip_name="GibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="251" y="378" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="285" y="327" rotation="0" clip_name="GibbetStick"/>
		  <Object type="gibbet" pers_id="1" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="306" y="332" rotation="0" clip_name="HangerPoint"/>
		  <Object type="ground" x="320" y="461" rotation="0" clip_name="Ground"/>
		  <Object type="gibbet_obliquely" inverted="false" x="71" y="162" rotation="0" clip_name="GibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="53" y="196" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="88" y="145" rotation="0" clip_name="GibbetStick"/>
		  <Object type="ammo_ghost" power="3" x="308" y="144" rotation="0" clip_name="AmmoGhost3"/>
		  <Object type="gibbet" pers_id="1" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="605" y="117" rotation="0" clip_name="HangerPoint"/>
		  <Object type="static_box" is_stone="true" x="605" y="97" rotation="0" clip_name="Stone0"/>
		  <Object type="vulture" inverted="false" x="58" y="116" rotation="0" clip_name="VultureHere"/>
		  <Object scaleX="1" scaleY="1" type="background" x="109" y="384" rotation="0" clip_name="BgStones"/>
		  <Object scaleX="1" scaleY="1" width="26.8" height="37.35" type="frontground" x="564" y="404" rotation="0" clip_name="flower_6"/>
		  <Object type="cloud" x="305" y="69" rotation="0" clip_name="Cloud9"/>
		  <Object type="cloud" x="379" y="23" rotation="0" clip_name="Cloud8"/>
		  <Object type="cloud" x="121" y="56" rotation="0" clip_name="Cloud7"/>
		  <Object type="cloud" x="-94" y="7" rotation="0" clip_name="Cloud5"/>
		  <Object type="cloud" x="584" y="31" rotation="0" clip_name="Cloud1"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="251" y="327" rotation="0" clip_name="Screw"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="52" y="320" rotation="0" clip_name="Screw"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="52" y="144" rotation="0" clip_name="Screw"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="299" y="322" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="100" y="314" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="97" y="139" rotation="0" clip_name="RopeRings"/>
		</Level>;
        private static const LEVEL_49:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="StarrySky"/>
		  <Object type="gibbet" pers_id="1" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="89" y="81" rotation="0" clip_name="HangerPoint"/>
		  <Object type="shooting_point" x="602" y="391" rotation="-60.00077819824219" clip_name="BowPoint"/>
		  <Object type="cloud" x="241" y="411" rotation="0" clip_name="Cloud0"/>
		  <Object type="cloud" x="639" y="431" rotation="0" clip_name="Cloud3"/>
		  <Object type="cloud" x="384" y="357" rotation="0" clip_name="Cloud7"/>
		  <Object type="cloud" x="-127" y="374" rotation="0" clip_name="Cloud8"/>
		  <Object type="cloud" x="73" y="433" rotation="0" clip_name="Cloud7"/>
		  <Object type="static_box" is_stone="true" x="89" y="63" rotation="0" clip_name="Brick"/>
		  <Object type="gibbet" pers_id="2" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="485" y="349" rotation="0" clip_name="HangerPoint"/>
		  <Object type="static_box" is_stone="true" x="485" y="330" rotation="0" clip_name="Brick"/>
		  <Object type="gibbet" pers_id="3" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="280" y="214" rotation="0" clip_name="HangerPoint"/>
		  <Object type="static_box" is_stone="true" x="280" y="196" rotation="0" clip_name="Brick"/>
		  <Object type="gibbet" pers_id="3" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="188" y="142" rotation="0" clip_name="HangerPoint"/>
		  <Object type="static_box" is_stone="true" x="188" y="124" rotation="0" clip_name="Brick"/>
		  <Object type="gibbet" pers_id="3" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="379" y="274" rotation="0" clip_name="HangerPoint"/>
		  <Object type="static_box" is_stone="true" x="379" y="256" rotation="0" clip_name="Brick"/>
		  <Object type="points_ghost" power="300" x="485" y="278" rotation="0" clip_name="PointsGhost300"/>
		  <Object type="points_ghost" power="500" x="379" y="204" rotation="0" clip_name="PointsGhost500"/>
		  <Object type="points_ghost" power="1000" x="281" y="148" rotation="0" clip_name="PointsGhost1000"/>
		  <Object type="points_ghost" power="300" x="187" y="74" rotation="0" clip_name="PointsGhost300"/>
		</Level>;
        private static const LEVEL_41:XML = null;
        private static const LEVEL_50:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="StarrySky"/>
		  <Object type="gibbet" pers_id="2" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="287" y="198" rotation="0" clip_name="HangerPoint" cloud_name="TryToShotMyLegsToShakeMeCloud" cloud_prob="1"/>
		  <Object type="shooting_point" x="71" y="321" rotation="59.99946594238281" clip_name="BowPoint"/>
		  <Object type="hedhehog_ghost" speed="0" charge="1" x="393" y="242" rotation="-60.0001220703125" clip_name="ArrowGhost1"/>
		  <Object type="static_box" is_stone="true" x="254" y="180" rotation="0" clip_name="BrickNoRight"/>
		  <Object type="static_box" is_stone="true" x="304" y="180" rotation="0" clip_name="BrickNoRightNoLeft"/>
		  <Object type="static_box" is_stone="true" x="354" y="180" rotation="0" clip_name="BrickNoRightNoLeft"/>
		  <Object type="static_box" is_stone="true" x="405" y="180" rotation="0" clip_name="BrickNoRightNoLeft"/>
		  <Object type="static_box" is_stone="true" x="456" y="180" rotation="0" clip_name="BrickNoLeft"/>
		  <Object type="static_box" is_stone="true" x="203" y="210" rotation="0" clip_name="Brick"/>
		  <Object type="static_box" is_stone="true" x="203" y="239" rotation="0" clip_name="Brick"/>
		  <Object type="cloud" x="564" y="413" rotation="0" clip_name="Cloud0"/>
		  <Object type="cloud" x="343" y="390" rotation="0" clip_name="Cloud3"/>
		  <Object type="cloud" x="164" y="343" rotation="0" clip_name="Cloud7"/>
		  <Object type="cloud" x="-238" y="401" rotation="0" clip_name="Cloud8"/>
		  <Object type="cloud" x="73" y="433" rotation="0" clip_name="Cloud7"/>
		  <Object type="ammo_ghost" power="3" x="271" y="132" rotation="0" clip_name="AmmoGhost3"/>
		  <Object type="ammo_ghost" power="5" x="357" y="131" rotation="0" clip_name="AmmoGhost5"/>
		  <Object type="points_ghost" power="1000" x="443" y="131" rotation="0" clip_name="PointsGhost1000"/>
		</Level>;
        private static const LEVEL_51:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="StarrySky"/>
		  <Object type="gibbet" pers_id="3" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="519" y="297" rotation="0" clip_name="HangerPoint" cloud_name="TakeAdditionArrows" cloud_prob="1"/>
		  <Object type="shooting_point" x="307" y="295" rotation="59.99946594238281" clip_name="BowPoint"/>
		  <Object type="gibbet" pers_id="2" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="114" y="297" rotation="0" clip_name="HangerPoint" cloud_name="TakeAdditionArrows" cloud_prob="1"/>
		  <Object type="gibbet_obliquely" inverted="false" x="85" y="308" rotation="0" clip_name="GibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="67" y="343" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="100" y="292" rotation="0" clip_name="GibbetStick"/>
		  <Object type="gibbet_obliquely" inverted="true" x="552" y="309" rotation="0" clip_name="InvertedGibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="570" y="344" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="536" y="292" rotation="0" clip_name="GibbetStick"/>
		  <Object type="gibbet_ground" x="98" y="434" rotation="0" clip_name="GibbetGround"/>
		  <Object type="gibbet_ground" x="527" y="437" rotation="0" clip_name="GibbetGround"/>
		  <Object type="ammo_ghost" power="10" x="685" y="28" rotation="0" clip_name="AmmoGhost10"/>
		  <Object type="highlight" size="150" x="311" y="26" rotation="0" clip_name="OnlyOneArrowHint"/>
		  <Object x="0" y="0" rotation="0" clip_name="OnlyOneArrowHint"/>
		  <Object type="cloud" x="192" y="379" rotation="0" clip_name="Cloud9"/>
		  <Object type="cloud" x="494" y="404" rotation="0" clip_name="Cloud7"/>
		  <Object type="cloud" x="-57" y="413" rotation="0" clip_name="Cloud5"/>
		  <Object type="cloud" x="692" y="441" rotation="0" clip_name="Cloud1"/>
		  <Object type="cloud" x="278" y="416" rotation="0" clip_name="Cloud8"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="511" y="286" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="107" y="286" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="67" y="292" rotation="0" clip_name="Screw"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="569" y="292" rotation="0" clip_name="Screw"/>
		</Level>;
        private static const LEVEL_52:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="StarrySky"/>
		  <Object type="shooting_point" x="325" y="254" rotation="-60.00077819824219" clip_name="BowPoint"/>
		  <Object type="cloud" x="241" y="411" rotation="0" clip_name="Cloud0"/>
		  <Object type="cloud" x="639" y="431" rotation="0" clip_name="Cloud3"/>
		  <Object type="cloud" x="384" y="357" rotation="0" clip_name="Cloud7"/>
		  <Object type="cloud" x="-127" y="374" rotation="0" clip_name="Cloud8"/>
		  <Object type="cloud" x="73" y="433" rotation="0" clip_name="Cloud7"/>
		  <Object type="gibbet" pers_id="3" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="114" y="245" rotation="0" clip_name="HangerPoint"/>
		  <Object type="static_box" is_stone="true" x="115" y="227" rotation="0" clip_name="Brick"/>
		  <Object type="ammo_ghost" power="10" x="116" y="181" rotation="0" clip_name="AmmoGhost10"/>
		  <Object type="points_ghost" power="1000" x="578" y="116" rotation="0" clip_name="PointsGhost1000"/>
		  <Object type="points_ghost" power="1000" x="578" y="170" rotation="0" clip_name="PointsGhost1000"/>
		  <Object type="points_ghost" power="1000" x="579" y="223" rotation="0" clip_name="PointsGhost1000"/>
		  <Object type="points_ghost" power="1000" x="579" y="272" rotation="0" clip_name="PointsGhost1000"/>
		  <Object type="points_ghost" power="1000" x="578" y="323" rotation="0" clip_name="PointsGhost1000"/>
		  <Object type="points_ghost" power="1000" x="579" y="373" rotation="0" clip_name="PointsGhost1000"/>
		  <Object type="points_ghost" power="1000" x="579" y="424" rotation="0" clip_name="PointsGhost1000"/>
		  <Object type="highlight" size="150" x="311" y="26" rotation="0" clip_name="NoArrowsHint"/>
		  <Object x="0" y="0" rotation="0" clip_name="NoArrowsHint"/>
		</Level>;
        private static const LEVEL_40:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="Background"/>
		  <Object scaleX="1" scaleY="1" type="background" x="307" y="103" rotation="0" clip_name="Mill"/>
		  <Object scaleX="1" scaleY="1" type="background" x="-2" y="352" rotation="0" clip_name="Back3"/>
		  <Object type="static_box" is_stone="true" x="328" y="427" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="294" y="427" rotation="0" clip_name="Stone2"/>
		  <Object type="gibbet_obliquely" inverted="false" x="62" y="354" rotation="0" clip_name="GibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="42" y="388" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="ground" x="320" y="461" rotation="0" clip_name="Ground"/>
		  <Object type="shooting_point" x="520" y="386" rotation="-44.99955749511719" clip_name="BowPoint"/>
		  <Object type="gibbet" pers_id="3" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="101" y="342" rotation="0" clip_name="HangerPoint"/>
		  <Object type="rotor" speed="70" scaleX="0.6999969542292874" scaleY="0.6999969542292874" x="364" y="150" rotation="89.99212646484375" clip_name="MillFan"/>
		  <Object type="gibbet" pers_id="4" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="92" y="187" rotation="0" clip_name="HangerPoint"/>
		  <Object scaleX="1" scaleY="1" type="background" x="307" y="227" rotation="0" clip_name="Mill"/>
		  <Object type="rotor" speed="-70" scaleX="0.6999816954403554" scaleY="0.6999816954403554" x="365" y="271" rotation="89.99212646484375" clip_name="MillFan"/>
		  <Object type="static_box" is_stone="true" x="329" y="393" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="328" y="359" rotation="0" clip_name="Stone3"/>
		  <Object type="static_box" is_stone="true" x="294" y="393" rotation="0" clip_name="Stone3"/>
		  <Object type="static_box" is_stone="true" x="294" y="359" rotation="0" clip_name="Stone0"/>
		  <Object type="static_box" is_stone="true" x="294" y="325" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="363" y="427" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="362" y="393" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="396" y="427" rotation="0" clip_name="Stone0"/>
		  <Object type="hedhehog_ghost" speed="0" charge="1" x="223" y="425" rotation="-49.999725341796875" clip_name="ArrowGhost1"/>
		  <Object type="hedhehog_ghost" speed="0" charge="1" x="223" y="380" rotation="-50.000244140625" clip_name="ArrowGhost1"/>
		  <Object type="hedhehog_ghost" speed="0" charge="1" x="31" y="270" rotation="39.999755859375" clip_name="ArrowGhost1"/>
		  <Object type="static_box" is_stone="false" x="76" y="338" rotation="0" clip_name="GibbetStick"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="42" y="338" rotation="0" clip_name="Screw"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="93" y="332" rotation="0" clip_name="RopeRings"/>
		  <Object type="static_box" is_stone="true" x="103" y="168" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="136" y="203" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="68" y="134" rotation="0" clip_name="Stone0"/>
		  <Object type="static_box" is_stone="true" x="136" y="168" rotation="0" clip_name="Stone3"/>
		  <Object type="static_box" is_stone="true" x="136" y="134" rotation="0" clip_name="Stone3"/>
		  <Object type="static_box" is_stone="true" x="102" y="134" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="382" y="62" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="348" y="62" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="382" y="27" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="381" y="-5" rotation="0" clip_name="Stone3"/>
		  <Object type="static_box" is_stone="true" x="348" y="28" rotation="0" clip_name="Stone3"/>
		  <Object type="static_box" is_stone="true" x="347" y="-5" rotation="0" clip_name="Stone0"/>
		  <Object type="points_ghost" power="1000" x="101" y="88" rotation="0" clip_name="PointsGhost1000"/>
		  <Object type="sun" x="576" y="85" rotation="0" clip_name="States.PlayState::Sun"/>
		  <Object scaleX="1" scaleY="1" width="27.65" height="18.1" type="frontground" x="120" y="426" rotation="0" clip_name="herb"/>
		  <Object scaleX="1" scaleY="1" width="27.65" height="18.1" type="frontground" x="473" y="427" rotation="0" clip_name="herb"/>
		  <Object type="cloud" x="145" y="6" rotation="0" clip_name="Cloud0"/>
		  <Object type="cloud" x="418" y="51" rotation="0" clip_name="Cloud3"/>
		  <Object type="cloud" x="623" y="18" rotation="0" clip_name="Cloud5"/>
		  <Object type="cloud" x="-76" y="51" rotation="0" clip_name="Cloud7"/>
		</Level>;
        public static const LEVELS:Array = [LEVEL_0, LEVEL_1, LEVEL_2, LEVEL_3, LEVEL_4, LEVEL_5, LEVEL_6, LEVEL_7, LEVEL_8, LEVEL_9, LEVEL_10, LEVEL_11, LEVEL_12, LEVEL_13, LEVEL_14, LEVEL_15, LEVEL_16, LEVEL_17, LEVEL_18, LEVEL_19, LEVEL_20, LEVEL_21, LEVEL_22, LEVEL_23, LEVEL_24, LEVEL_25, LEVEL_26, LEVEL_27, LEVEL_28, LEVEL_29, LEVEL_30, LEVEL_31, LEVEL_32, LEVEL_33, LEVEL_34, LEVEL_35, LEVEL_36, LEVEL_37, LEVEL_38, LEVEL_39, LEVEL_40, LEVEL_41, LEVEL_42, LEVEL_43, LEVEL_44, LEVEL_45, LEVEL_46, LEVEL_47, LEVEL_48, LEVEL_49, LEVEL_50, LEVEL_51, LEVEL_52];
        private static const LEVEL_10:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="Background"/>
		  <Object scaleX="1" scaleY="1" type="background" x="-3" y="353" rotation="0" clip_name="Back3"/>
		  <Object type="gibbet_obliquely" inverted="true" x="575" y="352" rotation="0" clip_name="InvertedGibbetObliquely"/>
		  <Object type="shooting_point" x="320" y="368" rotation="0.0008697509765625" clip_name="BowPoint"/>
		  <Object type="gibbet_obliquely" inverted="false" x="62" y="354" rotation="0" clip_name="GibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="43" y="388" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="80" y="337" rotation="180" clip_name="GibbetStick"/>
		  <Object type="gibbet" pers_id="4" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="92" y="342" rotation="0" clip_name="HangerPoint"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="85" y="331" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="43" y="336" rotation="0" clip_name="Screw"/>
		  <Object type="static_box" is_stone="true" x="417" y="426" rotation="0" clip_name="Stone1"/>
		  <Object type="ground" x="320" y="461" rotation="0" clip_name="Ground"/>
		  <Object type="static_box" is_stone="true" x="231" y="428" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="false" x="593" y="385" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="558" y="333" rotation="180" clip_name="GibbetStick"/>
		  <Object type="gibbet" pers_id="2" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="546" y="339" rotation="0" clip_name="HangerPoint"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="538" y="328" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="593" y="333" rotation="0" clip_name="Screw"/>
		  <Object type="static_box" is_stone="true" x="230" y="394" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="230" y="360" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="230" y="326" rotation="0" clip_name="Stone3"/>
		  <Object type="static_box" is_stone="true" x="417" y="392" rotation="0" clip_name="Stone0"/>
		  <Object type="static_box" is_stone="true" x="417" y="359" rotation="0" clip_name="Stone3"/>
		  <Object type="static_box" is_stone="true" x="417" y="325" rotation="0" clip_name="Stone2"/>
		  <Object type="teleport_ghost" x="474" y="406" rotation="0" clip_name="States.PlayState::TeleportGhost"/>
		  <Object type="teleport_ghost" x="319" y="413" rotation="0" clip_name="States.PlayState::TeleportGhost"/>
		  <Object type="teleport_ghost" x="164" y="402" rotation="0" clip_name="States.PlayState::TeleportGhost"/>
		  <Object type="points_ghost" power="500" x="554" y="296" rotation="0" clip_name="PointsGhost500"/>
		  <Object type="points_ghost" power="500" x="83" y="299" rotation="0" clip_name="PointsGhost500"/>
		  <Object scaleX="1" scaleY="1" width="27.65" height="18.1" type="frontground" x="83" y="425" rotation="0" clip_name="herb"/>
		  <Object scaleX="1" scaleY="1" width="27.65" height="18.1" type="frontground" x="508" y="426" rotation="0" clip_name="herb"/>
		  <Object type="sun" x="317" y="85" rotation="0" clip_name="States.PlayState::Sun"/>
		  <Object type="cloud" x="408" y="50" rotation="0" clip_name="Cloud7"/>
		  <Object type="cloud" x="543" y="22" rotation="0" clip_name="Cloud4"/>
		  <Object type="cloud" x="67" y="69" rotation="0" clip_name="Cloud2"/>
		  <Object type="cloud" x="-120" y="37" rotation="0" clip_name="Cloud1"/>
		  <Object type="cloud" x="303" y="97" rotation="0" clip_name="Cloud9"/>
		  <Object type="vulture" inverted="false" x="225" y="290" rotation="0" clip_name="VultureHere"/>
		</Level>;
        private static const LEVEL_11:XML = null;
        private static const LEVEL_12:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="Background"/>
		  <Object scaleX="1" scaleY="1" type="background" x="-1" y="357" rotation="0" clip_name="Back2"/>
		  <Object scaleX="1" scaleY="1" type="background" x="449" y="285" rotation="0" clip_name="tree_3"/>
		  <Object type="shooting_point" x="430" y="371" rotation="-49.999725341796875" clip_name="BowPoint"/>
		  <Object type="ground" x="320" y="461" rotation="0" clip_name="Ground"/>
		  <Object type="dynamic_box" x="234" y="432" rotation="0" clip_name="Box"/>
		  <Object type="dynamic_box" x="233" y="407" rotation="0" clip_name="Box"/>
		  <Object type="dynamic_box" x="233" y="357" rotation="0" clip_name="Box"/>
		  <Object type="dynamic_box" x="233" y="332" rotation="0" clip_name="Box"/>
		  <Object type="gibbet_obliquely" inverted="false" x="69" y="351" rotation="0" clip_name="GibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="50" y="385" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="50" y="269" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="84" y="334" rotation="180" clip_name="GibbetStick"/>
		  <Object type="gibbet" pers_id="1" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="101" y="339" rotation="0" clip_name="HangerPoint"/>
		  <Object type="tnt_barrel" x="463" y="92" rotation="0" clip_name="States.PlayState::TNTBarrel"/>
		  <Object type="cloud" x="542" y="26" rotation="0" clip_name="Cloud4"/>
		  <Object type="tnt_barrel" x="596" y="93" rotation="0" clip_name="States.PlayState::TNTBarrel"/>
		  <Object type="static_box" is_stone="true" x="472" y="131" rotation="0" clip_name="Stone0"/>
		  <Object type="static_box" is_stone="true" x="599" y="132" rotation="0" clip_name="Stone1"/>
		  <Object type="dynamic_box" x="233" y="382" rotation="0" clip_name="Box"/>
		  <Object type="static_box" is_stone="false" x="172" y="334" rotation="180" clip_name="GibbetStick"/>
		  <Object type="gibbet" pers_id="2" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="165" y="340" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet_obliquely" inverted="false" x="69" y="129" rotation="0" clip_name="GibbetObliquely"/>
		  <Object type="sun" x="68" y="68" rotation="0" clip_name="States.PlayState::Sun"/>
		  <Object type="static_box" is_stone="false" x="50" y="163" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="84" y="113" rotation="180" clip_name="GibbetStick"/>
		  <Object type="gibbet" pers_id="3" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="101" y="118" rotation="0" clip_name="HangerPoint"/>
		  <Object type="static_box" is_stone="false" x="172" y="113" rotation="180" clip_name="GibbetStick"/>
		  <Object type="gibbet" pers_id="4" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="165" y="118" rotation="0" clip_name="HangerPoint"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="49" y="334" rotation="0" clip_name="Screw"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="50" y="113" rotation="0" clip_name="Screw"/>
		  <Object scaleX="1" scaleY="1" width="27.65" height="18.1" type="frontground" x="313" y="425" rotation="0" clip_name="herb"/>
		  <Object scaleX="1" scaleY="1" width="33.6" height="37.6" type="frontground" x="72" y="407" rotation="0" clip_name="flower_1"/>
		  <Object scaleX="1" scaleY="1" width="27.55" height="35.7" type="frontground" x="496" y="406" rotation="0" clip_name="flower_0"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="93" y="107" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="93" y="329" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="157" y="329" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="158" y="107" rotation="0" clip_name="RopeRings"/>
		  <Object type="cloud" x="322" y="79" rotation="0" clip_name="Cloud9"/>
		  <Object type="cloud" x="165" y="24" rotation="0" clip_name="Cloud8"/>
		  <Object type="cloud" x="380" y="24" rotation="0" clip_name="Cloud7"/>
		  <Object type="cloud" x="-92" y="9" rotation="0" clip_name="Cloud5"/>
		  <Object type="highlight" size="150" x="461" y="92" rotation="0" clip_name="ThisIsTNTHint"/>
		  <Object x="0" y="0" rotation="0" clip_name="ThisIsTNTHint"/>
		</Level>;
        private static const LEVEL_13:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="Background"/>
		  <Object type="gibbet_obliquely" inverted="true" x="424" y="69" rotation="0" clip_name="InvertedGibbetObliquely"/>
		  <Object scaleX="1.006256103515625" scaleY="1" type="background" x="-4" y="329" rotation="0" clip_name="Back1"/>
		  <Object scaleX="1" scaleY="1" type="background" x="-3" y="161" rotation="0" clip_name="tree_7"/>
		  <Object scaleX="1" scaleY="1" type="background" x="364" y="352" rotation="0" clip_name="tree_1"/>
		  <Object type="shooting_point" x="538" y="382" rotation="-45" clip_name="BowPoint"/>
		  <Object type="gibbet_obliquely" inverted="true" x="320" y="354" rotation="0" clip_name="InvertedGibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="340" y="389" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="305" y="337" rotation="180" clip_name="GibbetStick"/>
		  <Object type="gibbet" pers_id="2" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="288" y="342" rotation="0" clip_name="HangerPoint"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="280" y="331" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="340" y="336" rotation="0" clip_name="Screw"/>
		  <Object type="ground" x="320" y="461" rotation="0" clip_name="Ground"/>
		  <Object type="static_box" is_stone="false" x="445" y="104" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="410" y="53" rotation="180" clip_name="GibbetStick"/>
		  <Object type="gibbet" pers_id="1" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="393" y="58" rotation="0" clip_name="HangerPoint"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="385" y="47" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="445" y="53" rotation="0" clip_name="Screw"/>
		  <Object type="hedhehog_ghost" speed="0" charge="1" x="37" y="381" rotation="69.99934387207031" clip_name="ArrowGhost1"/>
		  <Object type="hedhehog_ghost" speed="0" charge="1" x="137" y="413" rotation="14.0008544921875" clip_name="ArrowGhost1"/>
		  <Object type="hedhehog_ghost" speed="0" charge="1" x="293" y="137" rotation="40.00129699707031" clip_name="ArrowGhost1"/>
		  <Object type="gibbet_ground" x="396" y="200" rotation="0" clip_name="GibbetGround"/>
		  <Object type="sun" x="80" y="78" rotation="0" clip_name="States.PlayState::Sun"/>
		  <Object scaleX="1" scaleY="1" width="27.65" height="18.1" type="frontground" x="273" y="426" rotation="0" clip_name="herb"/>
		  <Object type="cloud" x="458" y="44" rotation="0" clip_name="Cloud6"/>
		  <Object type="cloud" x="613" y="85" rotation="0" clip_name="Cloud8"/>
		  <Object type="cloud" x="-26" y="39" rotation="0" clip_name="Cloud1"/>
		  <Object type="cloud" x="201" y="4" rotation="0" clip_name="Cloud0"/>
		  <Object type="cloud" x="-109" y="96" rotation="0" clip_name="Cloud9"/>
		  <Object type="ammo_ghost" power="5" x="411" y="412" rotation="0" clip_name="AmmoGhost5"/>
		</Level>;
        private static const LEVEL_14:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="Background"/>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="356" rotation="0" clip_name="Back2"/>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="293" rotation="0" clip_name="tree_6"/>
		  <Object type="static_box" is_stone="false" x="149" y="464" rotation="0" clip_name="GibbetColumn"/>
		  <Object scaleX="1" scaleY="1" type="background" x="429" y="152" rotation="0" clip_name="tree_5"/>
		  <Object type="gibbet_obliquely" inverted="true" x="478" y="316" rotation="0" clip_name="InvertedGibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="497" y="464" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="ground" x="320" y="461" rotation="0" clip_name="Ground"/>
		  <Object type="gibbet" pers_id="4" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="95" y="86" rotation="0" clip_name="HangerPoint"/>
		  <Object type="shooting_point" x="325" y="384" rotation="0" clip_name="BowPoint"/>
		  <Object type="hedhehog_ghost" speed="50" charge="3" x="323" y="251" rotation="-0.0008697509765625" clip_name="ArrowGhost3"/>
		  <Object type="gibbet" pers_id="1" path_to_hang="LEFT_LOWER_LEG" connect_legs="true" chains_count="9" x="214" y="303" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet" pers_id="2" path_to_hang="RIGHT_LOWER_LEG" connect_legs="true" chains_count="9" x="430" y="303" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet_obliquely" inverted="false" x="168" y="317" rotation="0" clip_name="GibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="149" y="348" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="184" y="298" rotation="0" clip_name="GibbetStick"/>
		  <Object type="static_box" is_stone="false" x="497" y="348" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="462" y="298" rotation="0" clip_name="GibbetStick"/>
		  <Object type="cloud" x="382" y="4" rotation="0" clip_name="Cloud5"/>
		  <Object type="cloud" x="213" y="73" rotation="0" clip_name="Cloud6"/>
		  <Object type="cloud" x="76" y="9" rotation="0" clip_name="Cloud1"/>
		  <Object type="sun" x="562" y="84" rotation="0" clip_name="States.PlayState::Sun"/>
		  <Object type="cloud" x="576" y="53" rotation="0" clip_name="Cloud3"/>
		  <Object type="cloud" x="-74" y="73" rotation="0" clip_name="Cloud2"/>
		  <Object type="hedhehog_ghost" speed="0" charge="1" x="321" y="129" rotation="-70.0001220703125" clip_name="ArrowGhost1"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="423" y="293" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="207" y="293" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="497" y="298" rotation="0" clip_name="Screw"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="148" y="298" rotation="0" clip_name="Screw"/>
		  <Object type="static_box" is_stone="false" x="22" y="80" rotation="0" clip_name="GibbetStick"/>
		  <Object type="static_box" is_stone="false" x="67" y="80" rotation="0" clip_name="GibbetStick"/>
		  <Object type="points_ghost" power="500" x="458" y="264" rotation="0" clip_name="PointsGhost500"/>
		  <Object type="points_ghost" power="1000" x="601" y="412" rotation="0" clip_name="PointsGhost1000"/>
		  <Object scaleX="1" scaleY="1" width="38.7" height="43.05" type="frontground" x="355" y="400" rotation="0" clip_name="flower_2"/>
		  <Object scaleX="1" scaleY="1" width="27.65" height="18.1" type="frontground" x="188" y="427" rotation="0" clip_name="herb"/>
		  <Object x="0" y="0" rotation="0" clip_name="ThisIsHedhehogHint"/>
		  <Object type="highlight" size="150" x="322" y="251" rotation="0" clip_name="ThisIsHedhehogHint"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="87" y="75" rotation="0" clip_name="RopeRings"/>
		</Level>;
        private static const LEVEL_15:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="Background"/>
		  <Object scaleX="1" scaleY="1" type="background" x="-9" y="279" rotation="0" clip_name="BonusGameBack"/>
		  <Object type="shooting_point" x="110" y="188" rotation="89.9947509765625" clip_name="BowPoint"/>
		  <Object type="tnt_barrel" x="159" y="69" rotation="0" clip_name="States.PlayState::TNTBarrel"/>
		  <Object type="gibbet" pers_id="4" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="395" y="240" rotation="0" clip_name="HangerPoint"/>
		  <Object type="cloud" x="118" y="82" rotation="0" clip_name="Cloud4"/>
		  <Object type="dynamic_box" x="223" y="77" rotation="0" clip_name="Box"/>
		  <Object type="tnt_barrel" x="401" y="69" rotation="0" clip_name="States.PlayState::TNTBarrel"/>
		  <Object type="static_box" is_stone="true" x="514" y="361" rotation="0" clip_name="Stone1"/>
		  <Object type="gibbet_obliquely" inverted="false" x="349" y="254" rotation="0" clip_name="GibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="330" y="288" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="true" x="379" y="361" rotation="0" clip_name="Stone3"/>
		  <Object type="static_box" is_stone="true" x="413" y="361" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="447" y="361" rotation="0" clip_name="Stone0"/>
		  <Object type="static_box" is_stone="false" x="366" y="236" rotation="0" clip_name="GibbetStick"/>
		  <Object type="static_box" is_stone="true" x="480" y="361" rotation="0" clip_name="Stone1"/>
		  <Object type="hedhehog_ghost" speed="0" charge="1" x="615" y="405" rotation="-41.08119201660156" clip_name="ArrowGhost1"/>
		  <Object type="dynamic_box" x="514" y="330" rotation="0" clip_name="Box"/>
		  <Object type="dynamic_box" x="514" y="305" rotation="0" clip_name="Box"/>
		  <Object type="dynamic_box" x="514" y="280" rotation="0" clip_name="Box"/>
		  <Object type="static_box" is_stone="true" x="280" y="108" rotation="0" clip_name="ComposedStone1"/>
		  <Object type="hedhehog_ghost" speed="0" charge="1" x="551" y="168" rotation="-139.99972534179688" clip_name="ArrowGhost1"/>
		  <Object type="static_box" is_stone="true" x="311" y="360" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="345" y="360" rotation="0" clip_name="Stone0"/>
		  <Object type="hedhehog_ghost" speed="0" charge="1" x="249" y="439" rotation="66.00038146972656" clip_name="ArrowGhost1"/>
		  <Object type="sun" x="578" y="89" rotation="0" clip_name="States.PlayState::Sun"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="330" y="236" rotation="0" clip_name="Screw"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="387" y="231" rotation="0" clip_name="RopeRings"/>
		  <Object type="cloud" x="499" y="53" rotation="0" clip_name="Cloud7"/>
		  <Object type="cloud" x="622" y="23" rotation="0" clip_name="Cloud6"/>
		  <Object type="cloud" x="56" y="33" rotation="0" clip_name="Cloud9"/>
		  <Object type="cloud" x="411" y="111" rotation="0" clip_name="Cloud9"/>
		</Level>;
        private static const LEVEL_16:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="Background"/>
		  <Object type="sun" x="77" y="74" rotation="0" clip_name="States.PlayState::Sun"/>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="357" rotation="0" clip_name="Back2"/>
		  <Object type="static_box" is_stone="true" x="196" y="364" rotation="0" clip_name="Stone0"/>
		  <Object type="static_box" is_stone="true" x="196" y="398" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="196" y="432" rotation="0" clip_name="Stone2"/>
		  <Object type="shooting_point" x="582" y="406" rotation="-45" clip_name="BowPoint"/>
		  <Object type="gibbet" pers_id="1" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="102" y="337" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet_obliquely" inverted="false" x="61" y="350" rotation="0" clip_name="GibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="43" y="385" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="true" x="162" y="388" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="162" y="422" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="162" y="456" rotation="0" clip_name="Stone0"/>
		  <Object scaleX="1" scaleY="1" type="background" x="210" y="160" rotation="0" clip_name="tree_7"/>
		  <Object type="ground" x="320" y="461" rotation="0" clip_name="Ground"/>
		  <Object type="static_box" is_stone="false" x="79" y="333" rotation="0" clip_name="GibbetStick"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="42" y="332" rotation="0" clip_name="Screw"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="95" y="327" rotation="0" clip_name="RopeRings"/>
		  <Object type="tnt_barrel" x="160" y="349" rotation="0" clip_name="States.PlayState::TNTBarrel"/>
		  <Object scaleX="1" scaleY="1" width="27.65" height="18.1" type="frontground" x="511" y="427" rotation="0" clip_name="herb"/>
		  <Object scaleX="1" scaleY="1" width="28.45" height="36.5" type="frontground" x="232" y="400" rotation="0" clip_name="flower_4"/>
		  <Object type="cloud" x="54" y="68" rotation="0" clip_name="Cloud9"/>
		  <Object type="cloud" x="146" y="18" rotation="0" clip_name="Cloud7"/>
		  <Object type="cloud" x="342" y="41" rotation="0" clip_name="Cloud6"/>
		  <Object type="cloud" x="566" y="15" rotation="0" clip_name="Cloud5"/>
		  <Object type="cloud" x="-133" y="18" rotation="0" clip_name="Cloud3"/>
		  <Object type="points_ghost" power="300" x="59" y="298" rotation="0" clip_name="PointsGhost300"/>
		  <Object type="points_ghost" power="300" x="301" y="414" rotation="0" clip_name="PointsGhost300"/>
		</Level>;
        private static const LEVEL_17:XML = null;
        private static const LEVEL_18:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="Background"/>
		  <Object scaleX="1" scaleY="1" type="background" x="-3" y="352" rotation="0" clip_name="Back3"/>
		  <Object scaleX="1" scaleY="1" type="background" x="202" y="314" rotation="0" clip_name="Mill"/>
		  <Object type="static_box" is_stone="false" x="18" y="432" rotation="0" clip_name="GibbetColumn"/>
		  <Object scaleX="1" scaleY="1" type="background" x="335" y="228" rotation="0" clip_name="tree_4"/>
		  <Object type="ground" x="320" y="461" rotation="0" clip_name="Ground"/>
		  <Object type="gibbet" pers_id="3" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="79" y="107" rotation="0" clip_name="HangerPoint"/>
		  <Object type="shooting_point" x="566" y="336" rotation="-80.00064086914063" clip_name="BowPoint"/>
		  <Object type="gibbet" pers_id="2" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="63" y="319" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet_obliquely" inverted="false" x="38" y="120" rotation="0" clip_name="GibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="21" y="153" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="55" y="103" rotation="0" clip_name="GibbetStick"/>
		  <Object type="gibbet_obliquely" inverted="false" x="36" y="332" rotation="0" clip_name="GibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="18" y="366" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="52" y="315" rotation="0" clip_name="GibbetStick"/>
		  <Object type="gibbet_ground" x="78" y="247" rotation="0" clip_name="GibbetGround"/>
		  <Object type="rotor" speed="90" scaleX="0.7999877982075193" scaleY="0.7999877982075193" x="260" y="358" rotation="89.99301147460938" clip_name="MillFan"/>
		  <Object scaleX="1" scaleY="1" type="background" x="201" y="162" rotation="0" clip_name="Mill"/>
		  <Object type="rotor" speed="-90" scaleX="1.0000000041909516" scaleY="1.0000000041909516" x="258" y="205" rotation="89.9947509765625" clip_name="MillFan"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="17" y="314" rotation="0" clip_name="Screw"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="20" y="103" rotation="0" clip_name="Screw"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="55" y="309" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="71" y="97" rotation="0" clip_name="RopeRings"/>
		  <Object type="sun" x="561" y="90" rotation="0" clip_name="States.PlayState::Sun"/>
		  <Object scaleX="1" scaleY="1" width="27.65" height="18.1" type="frontground" x="112" y="427" rotation="0" clip_name="herb"/>
		  <Object type="cloud" x="108" y="4" rotation="0" clip_name="Cloud0"/>
		  <Object type="cloud" x="337" y="43" rotation="0" clip_name="Cloud1"/>
		  <Object type="cloud" x="-163" y="82" rotation="0" clip_name="Cloud2"/>
		  <Object type="cloud" x="-68" y="22" rotation="0" clip_name="Cloud3"/>
		  <Object type="cloud" x="557" y="15" rotation="0" clip_name="Cloud5"/>
		</Level>;
        private static const LEVEL_19:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="1" y="0" rotation="0" clip_name="Background"/>
		  <Object scaleX="1.0032806396484375" scaleY="1" type="background" x="-3" y="332" rotation="0" clip_name="Back1"/>
		  <Object type="gibbet" pers_id="1" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="102" y="231" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet_obliquely" inverted="false" x="65" y="241" rotation="0" clip_name="GibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="48" y="276" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="83" y="224" rotation="0" clip_name="GibbetStick"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="95" y="219" rotation="0" clip_name="RopeRings"/>
		  <Object type="static_box" is_stone="false" x="601" y="123" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="shooting_point" x="516" y="354" rotation="-45" clip_name="BowPoint"/>
		  <Object type="gibbet" pers_id="2" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="544" y="77" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet" pers_id="3" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="102" y="347" rotation="0" clip_name="HangerPoint"/>
		  <Object type="hedhehog_ghost" speed="80" charge="4" x="422" y="153" rotation="0" clip_name="ArrowGhost4"/>
		  <Object type="gibbet_ground" x="561" y="212" rotation="0" clip_name="GibbetGround"/>
		  <Object type="static_box" is_stone="false" x="565" y="72" rotation="0" clip_name="GibbetStick"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="601" y="72" rotation="0" clip_name="Screw"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="537" y="67" rotation="0" clip_name="RopeRings"/>
		  <Object type="gibbet_obliquely" inverted="false" x="65" y="357" rotation="0" clip_name="GibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="48" y="398" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="83" y="341" rotation="0" clip_name="GibbetStick"/>
		  <Object type="static_box" is_stone="true" x="317" y="426" rotation="0" clip_name="Stone0"/>
		  <Object scaleX="1" scaleY="1" type="background" x="161" y="255" rotation="0" clip_name="tree_8"/>
		  <Object scaleX="1" scaleY="1" type="background" x="391" y="367" rotation="0" clip_name="tree_2"/>
		  <Object type="ground" x="321" y="461" rotation="0" clip_name="Ground"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="47" y="340" rotation="0" clip_name="Screw"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="95" y="335" rotation="0" clip_name="RopeRings"/>
		  <Object type="static_box" is_stone="true" x="317" y="392" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="317" y="357" rotation="0" clip_name="Stone2"/>
		  <Object type="sun" x="77" y="92" rotation="0" clip_name="States.PlayState::Sun"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="47" y="224" rotation="0" clip_name="Screw"/>
		  <Object scaleX="1" scaleY="1" width="27.65" height="18.1" type="frontground" x="115" y="428" rotation="0" clip_name="herb"/>
		  <Object scaleX="1" scaleY="1" width="38.7" height="43.05" type="frontground" x="565" y="400" rotation="0" clip_name="flower_2"/>
		  <Object type="cloud" x="465" y="26" rotation="0" clip_name="Cloud1"/>
		  <Object type="cloud" x="646" y="67" rotation="0" clip_name="Cloud3"/>
		  <Object type="cloud" x="-36" y="40" rotation="0" clip_name="Cloud5"/>
		  <Object type="cloud" x="-159" y="85" rotation="0" clip_name="Cloud6"/>
		  <Object type="cloud" x="183" y="30" rotation="0" clip_name="Cloud4"/>
		  <Object type="vulture" inverted="false" x="53" y="196" rotation="0" clip_name="VultureHere"/>
		</Level>;
        private static const LEVEL_20:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="Background"/>
		  <Object type="static_box" is_stone="true" x="348" y="241" rotation="0" clip_name="ComposedStone98"/>
		  <Object scaleX="1" scaleY="1" type="background" x="-12" y="280" rotation="0" clip_name="BonusGameBack"/>
		  <Object type="shooting_point" x="61" y="344" rotation="45" clip_name="BowPoint"/>
		  <Object type="gibbet_ground" x="563" y="481" rotation="0" clip_name="GibbetGround"/>
		  <Object type="gibbet_obliquely" inverted="true" x="591" y="355" rotation="0" clip_name="InvertedGibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="610" y="389" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="gibbet" pers_id="1" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="549" y="343" rotation="0" clip_name="HangerPoint"/>
		  <Object type="static_box" is_stone="false" x="575" y="337" rotation="0" clip_name="GibbetStick"/>
		  <Object type="static_box" is_stone="true" x="246" y="428" rotation="0" clip_name="ComposedStone98"/>
		  <Object type="cow" inverted="true" x="322" y="287" rotation="0" clip_name="InvertedCowHere"/>
		  <Object type="cow" inverted="false" x="272" y="99" rotation="0" clip_name="CowHere"/>
		  <Object type="ammo_ghost" power="10" x="494" y="421" rotation="0" clip_name="AmmoGhost10"/>
		  <Object type="ammo_ghost" power="5" x="578" y="303" rotation="0" clip_name="AmmoGhost5"/>
		  <Object type="gibbet_obliquely" inverted="true" x="558" y="86" rotation="0" clip_name="InvertedGibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="576" y="120" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="gibbet_ground" x="534" y="208" rotation="0" clip_name="GibbetGround"/>
		  <Object type="gibbet" pers_id="4" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="515" y="74" rotation="0" clip_name="HangerPoint"/>
		  <Object type="static_box" is_stone="false" x="540" y="68" rotation="0" clip_name="GibbetStick"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="610" y="337" rotation="0" clip_name="Screw"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="576" y="68" rotation="0" clip_name="Screw"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="541" y="332" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="507" y="62" rotation="0" clip_name="RopeRings"/>
		  <Object type="sun" x="93" y="93" rotation="0" clip_name="States.PlayState::Sun"/>
		  <Object type="cloud" x="91" y="14" rotation="0" clip_name="Cloud0"/>
		  <Object type="cloud" x="352" y="51" rotation="0" clip_name="Cloud1"/>
		  <Object type="cloud" x="-68" y="86" rotation="0" clip_name="Cloud2"/>
		  <Object type="cloud" x="601" y="71" rotation="0" clip_name="Cloud6"/>
		</Level>;
        private static const LEVEL_22:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="Background"/>
		  <Object scaleX="1" scaleY="1" type="background" x="-3" y="353" rotation="0" clip_name="Back3"/>
		  <Object scaleX="1" scaleY="1" type="background" x="27" y="228" rotation="0" clip_name="tree_4"/>
		  <Object type="shooting_point" x="578" y="94" rotation="-45" clip_name="BowPoint"/>
		  <Object type="gibbet" pers_id="3" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="559" y="340" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet_obliquely" inverted="true" x="585" y="352" rotation="0" clip_name="InvertedGibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="604" y="387" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="569" y="334" rotation="0" clip_name="GibbetStick"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="603" y="334" rotation="0" clip_name="Screw"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="551" y="328" rotation="0" clip_name="RopeRings"/>
		  <Object type="static_box" is_stone="true" x="239" y="435" rotation="0" clip_name="Brick"/>
		  <Object scaleX="1" scaleY="1" type="background" x="290" y="350" rotation="0" clip_name="tree_1"/>
		  <Object type="ground" x="320" y="461" rotation="0" clip_name="Ground"/>
		  <Object type="teleport_ghost" x="92" y="86" rotation="0" clip_name="States.PlayState::TeleportGhost"/>
		  <Object type="teleport_ghost" x="38" y="413" rotation="0" clip_name="States.PlayState::TeleportGhost"/>
		  <Object type="teleport_ghost" x="453" y="411" rotation="0" clip_name="States.PlayState::TeleportGhost"/>
		  <Object type="gibbet" pers_id="2" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="311" y="72" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet_obliquely" inverted="true" x="336" y="84" rotation="0" clip_name="InvertedGibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="356" y="118" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="321" y="66" rotation="0" clip_name="GibbetStick"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="355" y="66" rotation="0" clip_name="Screw"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="303" y="60" rotation="0" clip_name="RopeRings"/>
		  <Object type="gibbet_ground" x="315" y="214" rotation="0" clip_name="GibbetGround"/>
		  <Object type="hedhehog_ghost" speed="60" charge="3" x="232" y="286" rotation="0" clip_name="ArrowGhost3"/>
		  <Object type="static_box" is_stone="true" x="144" y="238" rotation="0" clip_name="BrickNoLeft"/>
		  <Object type="static_box" is_stone="true" x="93" y="238" rotation="0" clip_name="BrickNoRightNoLeft"/>
		  <Object type="static_box" is_stone="true" x="43" y="238" rotation="0" clip_name="BrickNoRight"/>
		  <Object type="points_ghost" power="300" x="51" y="191" rotation="0" clip_name="PointsGhost300"/>
		  <Object type="static_box" is_stone="true" x="322" y="292" rotation="0" clip_name="Brick"/>
		  <Object type="static_box" is_stone="true" x="322" y="320" rotation="0" clip_name="Brick"/>
		  <Object type="static_box" is_stone="true" x="322" y="349" rotation="0" clip_name="Brick"/>
		  <Object type="static_box" is_stone="true" x="239" y="406" rotation="0" clip_name="Brick"/>
		  <Object scaleX="1" scaleY="1" width="27.65" height="18.1" type="frontground" x="520" y="427" rotation="0" clip_name="herb"/>
		  <Object type="cloud" x="690" y="81" rotation="0" clip_name="Cloud9"/>
		  <Object type="cloud" x="506" y="29" rotation="0" clip_name="Cloud8"/>
		  <Object type="cloud" x="-159" y="53" rotation="0" clip_name="Cloud7"/>
		  <Object type="cloud" x="343" y="81" rotation="0" clip_name="Cloud6"/>
		  <Object type="cloud" x="-38" y="7" rotation="0" clip_name="Cloud5"/>
		  <Object type="cloud" x="184" y="46" rotation="0" clip_name="Cloud3"/>
		</Level>;
        private static const LEVEL_24:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="Background"/>
		  <Object scaleX="1" scaleY="1" type="background" x="-3" y="352" rotation="0" clip_name="Back3"/>
		  <Object type="shooting_point" x="538" y="405" rotation="-89.99563598632813" clip_name="BowPoint"/>
		  <Object type="static_box" is_stone="true" x="344" y="455" rotation="0" clip_name="Stone0"/>
		  <Object scaleX="1" scaleY="1" type="background" x="401" y="229" rotation="0" clip_name="tree_4"/>
		  <Object type="ground" x="320" y="461" rotation="0" clip_name="Ground"/>
		  <Object type="static_box" is_stone="true" x="344" y="321" rotation="0" clip_name="Stone1"/>
		  <Object type="gibbet" pers_id="2" path_to_hang="LEFT_LOWER_LEG" connect_legs="false" chains_count="8" x="87" y="109" rotation="0" clip_name="HangerPoint"/>
		  <Object type="static_box" is_stone="true" x="84" y="88" rotation="0" clip_name="Stone1"/>
		  <Object type="gibbet" pers_id="3" path_to_hang="LEFT_LOWER_HAND" connect_legs="false" chains_count="8" x="261" y="260" rotation="0" clip_name="HangerPoint"/>
		  <Object type="static_box" is_stone="true" x="262" y="240" rotation="0" clip_name="Stone1"/>
		  <Object type="gibbet" pers_id="4" path_to_hang="HEAD" connect_legs="false" chains_count="8" x="170" y="193" rotation="0" clip_name="HangerPoint"/>
		  <Object type="static_box" is_stone="true" x="171" y="173" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="344" y="354" rotation="0" clip_name="Stone3"/>
		  <Object type="static_box" is_stone="true" x="344" y="388" rotation="0" clip_name="Stone2"/>
		  <Object type="static_box" is_stone="true" x="344" y="422" rotation="0" clip_name="Stone0"/>
		  <Object type="static_box" is_stone="true" x="50" y="88" rotation="0" clip_name="Stone1"/>
		  <Object type="static_box" is_stone="true" x="17" y="88" rotation="0" clip_name="Stone3"/>
		  <Object type="cow" inverted="true" x="195" y="321" rotation="0" clip_name="InvertedCowHere"/>
		  <Object type="points_ghost" power="1000" x="69" y="42" rotation="0" clip_name="PointsGhost1000"/>
		  <Object type="sun" x="568" y="85" rotation="0" clip_name="States.PlayState::Sun"/>
		  <Object scaleX="1" scaleY="1" width="27.65" height="18.1" type="frontground" x="235" y="426" rotation="0" clip_name="herb"/>
		  <Object type="cloud" x="605" y="76" rotation="0" clip_name="Cloud8"/>
		  <Object type="cloud" x="479" y="55" rotation="0" clip_name="Cloud7"/>
		  <Object type="cloud" x="171" y="45" rotation="0" clip_name="Cloud4"/>
		  <Object type="cloud" x="-46" y="15" rotation="0" clip_name="Cloud1"/>
		  <Object type="cloud" x="-157" y="65" rotation="0" clip_name="Cloud9"/>
		</Level>;
        private static const LEVEL_26:XML = <Level>
		  <Object scaleX="1" scaleY="1" type="background" x="0" y="0" rotation="0" clip_name="Background"/>
		  <Object scaleX="1" scaleY="1" type="background" x="-3" y="331" rotation="0" clip_name="Back1"/>
		  <Object scaleX="1" scaleY="1" type="background" x="20" y="151" rotation="0" clip_name="tree_5"/>
		  <Object type="shooting_point" x="45" y="404" rotation="40.00077819824219" clip_name="BowPoint"/>
		  <Object type="gibbet" pers_id="2" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="559" y="340" rotation="0" clip_name="HangerPoint"/>
		  <Object type="gibbet_obliquely" inverted="true" x="585" y="352" rotation="0" clip_name="InvertedGibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="604" y="387" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="569" y="334" rotation="0" clip_name="GibbetStick"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="603" y="334" rotation="0" clip_name="Screw"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="551" y="328" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" type="background" x="455" y="370" rotation="0" clip_name="tree_2"/>
		  <Object type="ground" x="320" y="461" rotation="0" clip_name="Ground"/>
		  <Object type="gibbet_obliquely" inverted="true" x="586" y="235" rotation="0" clip_name="InvertedGibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="604" y="269" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="gibbet_obliquely" inverted="true" x="584" y="117" rotation="0" clip_name="InvertedGibbetObliquely"/>
		  <Object type="static_box" is_stone="false" x="604" y="152" rotation="0" clip_name="GibbetColumn"/>
		  <Object type="static_box" is_stone="false" x="569" y="100" rotation="0" clip_name="GibbetStick"/>
		  <Object type="gibbet" pers_id="1" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="557" y="106" rotation="0" clip_name="HangerPoint" cloud_name="RobinHoodMadeThatMuchBetter" cloud_prob="0.3"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="549" y="94" rotation="0" clip_name="RopeRings"/>
		  <Object type="static_box" is_stone="false" x="569" y="216" rotation="0" clip_name="GibbetStick"/>
		  <Object type="gibbet" pers_id="4" path_to_hang="HEAD" connect_legs="false" chains_count="7" x="557" y="223" rotation="0" clip_name="HangerPoint"/>
		  <Object scaleX="1" scaleY="1" width="15.2" height="11.55" type="frontground" x="549" y="211" rotation="0" clip_name="RopeRings"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="603" y="216" rotation="0" clip_name="Screw"/>
		  <Object scaleX="1" scaleY="1" width="6.3" height="6.3" type="frontground" x="603" y="99" rotation="0" clip_name="Screw"/>
		  <Object type="dynamic_box" x="285" y="431" rotation="0" clip_name="Box"/>
		  <Object type="dynamic_box" x="285" y="406" rotation="0" clip_name="Box"/>
		  <Object type="dynamic_box" x="285" y="381" rotation="0" clip_name="Box"/>
		  <Object type="dynamic_box" x="285" y="356" rotation="0" clip_name="Box"/>
		  <Object type="dynamic_box" x="285" y="331" rotation="0" clip_name="Box"/>
		  <Object type="dynamic_box" x="285" y="307" rotation="0" clip_name="Box"/>
		  <Object type="dynamic_box" x="580" y="82" rotation="0" clip_name="Box"/>
		  <Object type="dynamic_box" x="547" y="82" rotation="0" clip_name="Box"/>
		  <Object type="dynamic_box" x="564" y="57" rotation="0" clip_name="Box"/>
		  <Object scaleX="1" scaleY="1" width="28.45" height="36.5" type="frontground" x="352" y="399" rotation="0" clip_name="flower_4"/>
		  <Object type="sun" x="303" y="68" rotation="0" clip_name="States.PlayState::Sun"/>
		  <Object type="cloud" x="-166" y="6" rotation="0" clip_name="Cloud0"/>
		  <Object type="cloud" x="42" y="17" rotation="0" clip_name="Cloud1"/>
		  <Object type="cloud" x="322" y="39" rotation="0" clip_name="Cloud2"/>
		  <Object type="cloud" x="432" y="80" rotation="0" clip_name="Cloud3"/>
		  <Object type="cloud" x="609" y="-2" rotation="0" clip_name="Cloud4"/>
		</Level>;

        public function Levels()
        {
            return;
        }// end function

    }
}
