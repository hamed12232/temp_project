import 'dart:developer';

import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import 'image_picker_result.dart';

@lazySingleton
class ImagePickerService {
  final ImagePicker _picker;

  ImagePickerService() : _picker = ImagePicker();

  Future<XFile?> pickSingleImage(ImagePickerSource source) async {
    try {
      final imageSource = source == ImagePickerSource.camera
          ? ImageSource.camera
          : ImageSource.gallery;

      return await _picker.pickImage(source: imageSource);
    } catch (e) {
      log('ImagePickerService.pickSingleImage error: $e');
      return null;
    }
  }

  Future<List<XFile>> pickMultipleImages() async {
    try {
      return await _picker.pickMultiImage();
    } catch (e) {
      log('ImagePickerService.pickMultipleImages error: $e');
      return [];
    }
  }
}
