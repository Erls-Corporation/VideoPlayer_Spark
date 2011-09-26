package media
{	
	import com.greensock.TweenLite;
	
	import media.skins.GraphiteVideoPlayerSkin;
	
	import org.osmf.events.TimeEvent;
	
	import spark.components.Group;
	import spark.components.VideoDisplay;
	import spark.components.VideoPlayer;

	public class MyVideoPlayer extends Group
	{
		private var videoURL:String;
		private var myVideo:VideoPlayer = new VideoPlayer();

		public function MyVideoPlayer(_width:Number, _height:Number, _intialVolume:Number, _videoURL:String)
		{
			trace("Video Player Construced");
			
			videoURL = _videoURL;
			
			myVideo.setStyle("skinClass", Class(GraphiteVideoPlayerSkin));
			
			myVideo.source = videoURL;
			myVideo.volume = _intialVolume;
			myVideo.width = _width;
			//myVideo.height = _height;
			myVideo.autoPlay = false;
			addElement(myVideo);
			
		}
		
		public function startVideo():void
		{
			myVideo.addEventListener(TimeEvent.COMPLETE, videoComplete);
			myVideo.play();
		}
		
		public function stopVideo():void
		{
			myVideo.stop();
		}
		
		public function pauseVideo():void
		{
			myVideo.pause();
		}
		
		public function getCurrentTime():Number
		{
			return myVideo.currentTime;
		}
		
		public function getDuration():Number
		{
			return myVideo.duration;
		}
		
		private function videoComplete(e:TimeEvent):void
		{
			myVideo.removeEventListener(TimeEvent.COMPLETE, videoComplete);
			dispatchEvent(new TimeEvent(TimeEvent.COMPLETE));
			
			// Dispatch video complete to GA
		}
		
		public function setVideoURL(_videoURL:String):void
		{
			videoURL = _videoURL;
			myVideo.source = videoURL
		}
	
	}
}