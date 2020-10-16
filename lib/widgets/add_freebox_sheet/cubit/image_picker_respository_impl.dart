import 'dart:io';

import 'package:freebox/widgets/add_freebox_sheet/cubit/image_picker_repository.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerRepositoryImpl implements ImagePickerRepository {
  final _imagePicker = ImagePicker();
  File _image;

  @override
  bool get hasUserPickedImage => _image != null;

  @override
  Future<void> getImage() async {
    try {
      final pickedFile = await _imagePicker.getImage(
        imageQuality: 50,
        source: ImageSource.gallery,
      );
      _image = File(pickedFile.path);
    } catch (e) {
      print(e);
    }
  }

  @override
  File get pickedImage => _image;
}
