import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'freebox_image_picker_state.dart';

class FreeboxImagePickerCubit extends Cubit<FreeboxImagePickerState> {
  FreeboxImagePickerCubit() : super(FreeboxImagePickerInitial());
  final _imagePicker = ImagePicker();
  var image;

  Future<void> getImage() async {
    try {
      final pickedFile = await _imagePicker.getImage(
        imageQuality: 50,
        source: ImageSource.camera,
      );
      image = File(pickedFile.path);
      emit(FreeboxImagePickerLoaded(image));
    } catch (e) {
      print(e);
    }
  }
}
