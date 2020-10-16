import 'dart:io';

abstract class ImagePickerRepository {
  Future<void> getImage();
  // set userPickedImage(bool value);

  File get pickedImage;

  bool get hasUserPickedImage;
}
