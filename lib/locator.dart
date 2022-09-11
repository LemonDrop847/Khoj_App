import 'package:khoj_app_hack/services/camera.service.dart';
import 'package:khoj_app_hack/services/ml_service.dart';
import 'package:khoj_app_hack/services/face_detector_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupServices() {
  locator.registerLazySingleton<CameraService>(() => CameraService());
  locator
      .registerLazySingleton<FaceDetectorService>(() => FaceDetectorService());
  locator.registerLazySingleton<MLService>(() => MLService());
}
