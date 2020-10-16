part of 'image_picker_cubit.dart';

@immutable
abstract class ImagePickerState {
  const ImagePickerState();
}

class ImagePickerInitial extends ImagePickerState {
  const ImagePickerInitial();
}

class ImagePickerLoaded extends ImagePickerState {
  final File image;
  const ImagePickerLoaded(this.image);
}
