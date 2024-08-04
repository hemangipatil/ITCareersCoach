import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoExample extends StatefulWidget {

  @override
  _VideoExampleState createState() => _VideoExampleState();
}

class _VideoExampleState extends State<VideoExample> {

  VideoPlayerController controller;
  VoidCallback listener;
  Future<void> futureControer;

  @override
  void initState() {
    controller = VideoPlayerController.asset("assets/videos/sample.mp4");
    //  controller = VideoPlayerController.network('https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4');
    futureControer = controller.initialize();
    controller.setLooping(true);
    controller.setVolume(25);
    super.initState();
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Example'),
      ),
      body: Center(
          child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                  child:
                  FutureBuilder(
                      future: futureControer,
                      builder: ( context, snapshot){
                        if(snapshot.connectionState == ConnectionState.active) {
                          return VideoPlayer(controller);
                        }
                        else{
                          return Center(child: CircularProgressIndicator());
                        }
                      }
                  )
              )
          )
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (controller.value.isPlaying){
              controller.pause();
            }
            else
            {
              controller.play();
            }
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
