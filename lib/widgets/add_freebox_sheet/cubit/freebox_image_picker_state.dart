part of 'freebox_image_picker_cubit.dart';

@immutable
abstract class FreeboxImagePickerState {
  const FreeboxImagePickerState();
}

class FreeboxImagePickerInitial extends FreeboxImagePickerState {
  const FreeboxImagePickerInitial();
}

class FreeboxImagePickerLoaded extends FreeboxImagePickerState {
  final File image;
  const FreeboxImagePickerLoaded(this.image);
}
