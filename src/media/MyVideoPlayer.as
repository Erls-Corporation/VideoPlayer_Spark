package media
{	
	import spark.components.Group;
	import spark.components.VideoDisplay;
	import spark.components.VideoPlayer;
	import media.skins.GraphiteVideoPlayerSkin;

	public class MyVideoPlayer extends Group
	{
		private var videoURL:String = "media/assets/em.flv";
		private var myVideo:VideoPlayer = new VideoPlayer();

		public function MyVideoPlayer()
		{
			trace("Video Player Construced");
			
			myVideo.setStyle("skinClass", Class(GraphiteVideoPlayerSkin));
			
			//myVideo.fullScreenButton.enabled = false;
			myVideo.source = videoURL;
			myVideo.volume = .5;
			myVideo.width = 680;
			myVideo.height = 320;
			myVideo.autoPlay = false;
			
			addElement(myVideo);
			
		}
		
		public function startVideo():void
		{
			myVideo.play();
		}
	}
}