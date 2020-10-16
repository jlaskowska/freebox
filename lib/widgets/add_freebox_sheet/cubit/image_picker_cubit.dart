import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:freebox/widgets/add_freebox_sheet/cubit/image_picker_repository.dart';

part 'image_picker_state.dart';

class ImagePickerCubit extends Cubit<ImagePickerState> {
  final ImagePickerRepository _imagePickerRepository;

  ImagePickerCubit(this._imagePickerRepository) : super(ImagePickerInitial());

  Future<void> getImage() async {
    await _imagePickerRepository.getImage();
    if (_imagePickerRepository.hasUserPickedImage) {
      emit(ImagePickerLoaded(_imagePickerRepository.pickedImage));
    }
  }
}
