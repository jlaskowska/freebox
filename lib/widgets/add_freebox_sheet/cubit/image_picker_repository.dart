import 'dart:io';

abstract class ImagePickerRepository {
  Future<void> getImage();

  File get pickedImage;

  bool get hasUserPickedImage;
}
