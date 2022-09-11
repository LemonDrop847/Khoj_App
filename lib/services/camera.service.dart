import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class CameraService {
  late CameraController _cameraController;
  CameraController get cameraController => this._cameraController;

  late CameraDescription _cameraDescription;

  late InputImageRotation _cameraRotation;
  InputImageRotation get cameraRotation => this._cameraRotation;

  late String _imagePath;
  String get imagePath => this._imagePath;

  Future startService(CameraDescription cameraDescription) async {
    this._cameraDescription = cameraDescription;
    this._cameraController = CameraController(
      this._cameraDescription,
      ResolutionPreset.high,
      enableAudio: false,
    );

    // sets the rotation of the image
    this._cameraRotation = rotationIntToImageRotation(
      this._cameraDescription.sensorOrientation,
    );

    // Next, initialize the controller. This returns a Future.
    return this._cameraController.initialize();
  }

  InputImageRotation rotationIntToImageRotation(int rotation) {
    switch (rotation) {
      case 90:
        return InputImageRotation.rotation90deg;
      case 180:
        return InputImageRotation.rotation180deg;
      case 270:
        return InputImageRotation.rotation270deg;
      default:
        return InputImageRotation.rotation0deg;
    }
  }

  Future<XFile> takePicture() async {
    XFile file = await _cameraController.takePicture();
    this._imagePath = file.path;
    return file;
  }

  Size getImageSize() {
    return Size(
      _cameraController.value.previewSize!.height,
      _cameraController.value.previewSize!.width,
    );
  }

  dispose() {
    this._cameraController.dispose();
  }
}
