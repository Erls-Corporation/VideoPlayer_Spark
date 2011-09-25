package media
{	
	import com.greensock.TimelineLite;
	import com.greensock.TimelineMax;
	import com.greensock.TweenLite;
	
	import flash.events.AsyncErrorEvent;
	import flash.events.MouseEvent;
	import flash.events.NetStatusEvent;
	import flash.events.SecurityErrorEvent;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import flash.ui.Mouse;
	
	import flashx.textLayout.conversion.TextConverter;
	import flashx.textLayout.elements.ParagraphElement;
	import flashx.textLayout.elements.SpanElement;
	import flashx.textLayout.elements.TextFlow;
	import flashx.textLayout.formats.TextLayoutFormat;
	
	import spark.components.Group;
	import spark.components.HSlider;
	import spark.components.RichText;
	import spark.components.VideoDisplay;
	import spark.components.VideoPlayer;
	import spark.primitives.BitmapImage;
	import spark.primitives.Graphic;
	import media.skins.GraphiteVideoPlayerSkin;

	public class MyVideoPlayer extends Group
	{
		[Embed(source="./assets/SpeakerIcon.png")]
		public var SpeakerIcon:Class;
		
		private var timeCode:RichText = new RichText();
		private var videoURL:String = "media/assets/em.flv";

		public function MyVideoPlayer()
		{
			trace("Video Player Construced");
			
			var myVideo:VideoPlayer = new VideoPlayer();
			myVideo.source = videoURL;
			myVideo.setStyle("skinClass", Class(GraphiteVideoPlayerSkin));
			myVideo.volume = .5;
			myVideo.width = 680;
			myVideo.height = 320;
			myVideo.autoPlay = false;
			
			addElement(myVideo);
			
		}
		
		private function setupUI():void
		{
			var myFormat:TextLayoutFormat = new TextLayoutFormat();
			myFormat.color = 0x009900;
			myFormat.fontSize = "12";
			myFormat.fontFamily = "Arial";
			
			var myTextFlow:TextFlow = new TextFlow();
			var myP:ParagraphElement = new ParagraphElement();
			var myS:SpanElement = new SpanElement();
			myS.text = "video player";
			myP.addChild(myS);
			myTextFlow.addChild(myP);
			myTextFlow.format = myFormat;
			timeCode.textFlow = myTextFlow;
			
			addElement(timeCode);
			
			var volumeSlider:HSlider = new HSlider();
			volumeSlider.width = 100;
			volumeSlider.minimum = 0;
			volumeSlider.maximum = 10;
			volumeSlider.stepSize = .5;
			volumeSlider.x = 30;
			volumeSlider.y = 100;
			addElement(volumeSlider);
			
			//var speakerIcon:BitmapImage = new SpeakerIconCls() as BitmapImage;
			var speakerIcon:BitmapImage = new BitmapImage();
			speakerIcon.source = SpeakerIcon;
			speakerIcon.x = 10;
			speakerIcon.y = 40;
			addElement(speakerIcon);
		}
		
		private function timeCodeFormat(timeinSeconds:Number):String{
			var seconds:Number = Math.floor(timeinSeconds);
			var minutes:Number = Math.floor(seconds / 60);
			
			//Storing the remainder of this division problem
			seconds %= 60;
			minutes %= 60;
			
			//Converting numerical values into strings so that
			//we string all of these numbers together for the display
			var sec:String = seconds.toString();
			var min:String = minutes.toString();
			
			//Setting up a few restrictions for when the current time reaches a single digit
			if (sec.length < 2) {
				sec = "0" + sec;
			}
			
			if (min.length < 2) {
				min = "0" + min;
			}
			
			//Stringing all of the numbers together for the display
			var timeCode:String = min + ":" + sec;
			
			//Setting the string to the display
			return timeCode;
		}
	}
}