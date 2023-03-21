import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

abstract class ImageServiceInterface {
  Future<String> pickImage();
  Future<File> getImage(String name);
}

class ImageService implements ImageServiceInterface {
  final ImagePicker imagePicker;
  ImageService(this.imagePicker);
  @override

  /// Returns the path of selected image
  Future<String> pickImage() async {
    try {
      XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
      Directory documentDirectory = await getApplicationDocumentsDirectory();
      String imagePath = "${documentDirectory.path}/${file!.name}";
      file.saveTo(imagePath);
      return imagePath;
    } catch (_) {
      return "error";
    }
  }

  @override
  Future<File> getImage(String name) async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String imagePath = "${documentDirectory.path}/$name";
    return File(imagePath);
  }
}

final imageService =
    Provider<ImageService>((ref) => ImageService(ImagePicker()));
