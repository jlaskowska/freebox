import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freebox/modules/backend_service/bacend_service.dart';
import 'package:meta/meta.dart';

part 'upload_freebox_state.dart';

class UploadFreeboxCubit extends Cubit<UploadFreeboxState> {
  final IBackendService _backendService;
  UploadFreeboxCubit(this._backendService) : super(UploadFreeboxInitial());

  Future<void> uploadFreebox(File image, String description, String address) async {
    if (image != null && description != null && address != null) {
      try {
        emit(UploadFreeboxUploading());
        final result = await _backendService.publishFreebox(image: image, description: description, address: address);
        if (result) {
          emit(UploadFreeboxUploaded());
        }
      } catch (e) {
        print(e);
        emit(UploadFreeboxInitial());
      }
    }
  }
}
