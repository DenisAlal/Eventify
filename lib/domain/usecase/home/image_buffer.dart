import 'package:camera/camera.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class ImageBuffer {
  String? carNumber;
  XFile? imagePath;
}