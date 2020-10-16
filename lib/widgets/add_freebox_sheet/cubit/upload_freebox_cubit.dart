import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'upload_freebox_state.dart';

class UploadFreeboxCubit extends Cubit<UploadFreeboxState> {
  UploadFreeboxCubit() : super(UploadFreeboxInitial());
}
