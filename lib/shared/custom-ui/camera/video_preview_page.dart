import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:whatsapp_clone/controllers/camera/camera_controller.dart';

class VideoPreviewPage extends StatefulWidget {
  final XFile file;
  const VideoPreviewPage({Key? key, required this.file}) : super(key: key);

  @override
  _VideoPreviewPageState createState() => _VideoPreviewPageState();
}

class _VideoPreviewPageState extends State<VideoPreviewPage> {
  final cameraController = Get.put(CameraStatusController());

  @override
  void initState() {
    // init();
    super.initState();
  }

  void init() {
    cameraController.initVideo(widget.file)?.then((v) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.crop_rotate,
                size: 27,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.emoji_emotions_outlined,
                size: 27,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.title,
                size: 27,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                size: 27,
              )),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 150,
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder(
                  future: cameraController.cameraValue,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return cameraController
                              .videoPlayerController!.value.isInitialized
                          ? AspectRatio(
                              aspectRatio: cameraController
                                  .videoPlayerController!.value.aspectRatio,
                              child: VideoPlayer(
                                  cameraController.videoPlayerController!),
                            )
                          : Container();
                    }
                  }),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                color: Colors.black87,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                child: TextFormField(
                  style: TextStyle(color: Colors.white, fontSize: 17),
                  maxLines: 6,
                  minLines: 1,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.add_a_photo,
                        color: Colors.white,
                        size: 27,
                      ),
                      border: InputBorder.none,
                      hintText: 'Add caption',
                      hintStyle: TextStyle(color: Colors.white, fontSize: 17),
                      suffixIcon: CircleAvatar(
                        radius: 27,
                        backgroundColor: Colors.tealAccent,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 27,
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
