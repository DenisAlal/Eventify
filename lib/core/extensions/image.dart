import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:cross_file/cross_file.dart';
import 'package:image_picker/image_picker.dart';

extension ImageExtension on Image {

  static Future<ImageProvider?> xFileToImage(XFile? xFile) async {
    if (xFile != null) {
      final Uint8List bytes = await xFile.readAsBytes();
      return Image.memory(bytes).image;
    }
    return null;
  }
}