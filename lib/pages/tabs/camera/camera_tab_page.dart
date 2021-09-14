import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/controllers/camera/camera_controller.dart';

class CameraTabPage extends StatefulWidget {
  const CameraTabPage({Key? key}) : super(key: key);

  @override
  _CameraTabPageState createState() => _CameraTabPageState();
}

class _CameraTabPageState extends State<CameraTabPage> {
  final controller = Get.put(CameraStatusController());

  @override
  void initState() {
    controller.initCamera()!.then((v) => {setState(() {})});
    super.initState();
  }

  @override
  void dispose() {
    controller.cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CameraStatusController>(
        init: CameraStatusController(),
        builder: (_) {
          return Scaffold(
            body: Stack(
              children: [
                FutureBuilder(
                    future: controller.cameraValue,
                    builder: (_, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Camera no avaliable'),
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.done) {
                        return CameraPreview(controller.cameraController!);
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
                Positioned(
                  bottom: 0.0,
                  child: Container(
                    color: Colors.black,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    child: Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.flash_off,
                                  color: Colors.white,
                                  size: 28,
                                )),
                            Material(
                              type: MaterialType.transparency,
                              child: GestureDetector(
                                  onLongPress: () {
                                    if (!_.isRecording.value) {
                                      _.startVideo();
                                    }
                                  },
                                  onLongPressUp: () {
                                    if (_.isRecording.value) {
                                      _.takeVideo();
                                    }
                                  },
                                  onTap: () async {
                                    if (!_.isRecording.value) {
                                      await controller.takePicture();
                                    }
                                  },
                                  child: _.isRecording.value
                                      ? Icon(
                                          Icons.radio_button_checked,
                                          color: Colors.red,
                                          size: 80,
                                        )
                                      : Icon(
                                          Icons.panorama_fish_eye,
                                          color: Colors.white,
                                          size: 70,
                                        )),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.flip_camera_ios,
                                  color: Colors.white,
                                  size: 28,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Hold for video or tap for photo',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
