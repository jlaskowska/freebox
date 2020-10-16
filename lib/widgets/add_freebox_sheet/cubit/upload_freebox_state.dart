part of 'upload_freebox_cubit.dart';

@immutable
abstract class UploadFreeboxState {
  const UploadFreeboxState();
}

class UploadFreeboxInitial extends UploadFreeboxState {
  const UploadFreeboxInitial();
}

class UploadFreeboxUploading extends UploadFreeboxState {
  const UploadFreeboxUploading();
}

class UploadFreeboxUploaded extends UploadFreeboxState {
  const UploadFreeboxUploaded();
}
