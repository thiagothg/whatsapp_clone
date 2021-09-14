import 'dart:io';

import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:whatsapp_clone/shared/custom-ui/camera/photo_preview_page.dart';
import 'package:whatsapp_clone/shared/custom-ui/camera/video_preview_page.dart';

class CameraStatusController extends GetxController {
  CameraController? cameraController;

  Future? cameraValue;
  RxBool isRecording = false.obs;
  VideoPlayerController? videoPlayerController;

  Future<void>? initCamera() async {
    var cameras = await availableCameras();
    if (cameras.length > 0) {
      cameraController = CameraController(cameras[0], ResolutionPreset.high,
          imageFormatGroup: ImageFormatGroup.bgra8888);
      cameraValue = cameraController!.initialize();
      cameraController?.setFlashMode(FlashMode.off);
    } else {
      throw ('No Cameras avaliable');
    }
  }

  Future<void> takePicture() async {
    try {
      if (cameraController != null) {
        var file = await cameraController!.takePicture();
        await Future.delayed(Duration(milliseconds: 500));
        Get.to(() => PhotoPreviewPage(
              file: file,
            ));
      }
    } on CameraException catch (e) {
      print(e.description);
    }
  }

  Future<void> startVideo() async {
    try {
      print('startVideo');
      cameraController?.prepareForVideoRecording();
      cameraController?.startVideoRecording();
      isRecording.value = true;
      update();
    } on CameraException catch (e) {
      print(e.description);
    }
  }

  Future<void> takeVideo() async {
    try {
      print('stopVideo');
      var file = await cameraController?.stopVideoRecording();
      isRecording.value = false;
      // update();
      Get.to(() => VideoPreviewPage(file: file!));
      // print(file?.path);
    } on CameraException catch (e) {
      print(e.description);
    }
  }

  Future<void>? initVideo(XFile file) {
    videoPlayerController = VideoPlayerController.file(File(file.path))
      ..initialize();

    update();
  }
}
