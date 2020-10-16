import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freebox/configs/app_colors.dart';
import 'package:freebox/localizations.dart';
import 'package:freebox/widgets/add_freebox_sheet/cubit/image_picker_cubit.dart';
import 'package:freebox/widgets/add_freebox_sheet/cubit/image_picker_repository.dart';
import 'package:freebox/widgets/add_freebox_sheet/cubit/image_picker_respository_impl.dart';
import 'package:freebox/widgets/custom_circular_progress_indicator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AddFreeboxSheet extends StatefulWidget {
  AddFreeboxSheet({Key key}) : super(key: key);

  @override
  _AddFreeboxSheetState createState() => _AddFreeboxSheetState();
}

class _AddFreeboxSheetState extends State<AddFreeboxSheet> {
  final _descriptionController = TextEditingController();
  final _adressController = TextEditingController();
  FocusNode _focusNode1;
  FocusNode _focusNode2;

  @override
  void initState() {
    super.initState();

    _focusNode1 = FocusNode();
    _focusNode2 = FocusNode();
  }

  @override
  void dispose() {
    _focusNode1.dispose();
    _focusNode2.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<ImagePickerRepository>(
      create: (context) => ImagePickerRepositoryImpl(),
      child: BlocProvider<ImagePickerCubit>(
        create: (context) => ImagePickerCubit(context.repository<ImagePickerRepository>()),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: BlocBuilder<ImagePickerCubit, ImagePickerState>(
                builder: (context, state) {
                  if (state is ImagePickerInitial) {
                    return FreeboxImagePicker(
                      onPressed: () async => await context.bloc<ImagePickerCubit>().getImage(),
                      opacity: 0.4,
                      isImageLoaded: false,
                      child: Icon(
                        MdiIcons.cloudUploadOutline,
                      ),
                    );
                  } else if (state is ImagePickerLoaded) {
                    return FreeboxImagePicker(
                      onPressed: () async => await context.bloc<ImagePickerCubit>().getImage(),
                      isImageLoaded: true,
                      opacity: 1,
                      child: Image.file(
                        state.image,
                        fit: BoxFit.cover,
                      ),
                    );
                  } else {
                    return CustomCircularProgressIndicator();
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                focusNode: _focusNode1,
                onSubmitted: (String value) => FocusScope.of(context).requestFocus(_focusNode2),
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.addFreeboxSheetUpTextFieldDescription,
                ),
                maxLines: 2,
                keyboardType: TextInputType.text,
                cursorColor: Theme.of(context).primaryColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                focusNode: _focusNode2,
                controller: _adressController,
                decoration: InputDecoration(labelText: AppLocalizations.addFreeboxSheetUpTextFieldAdress),
                keyboardType: TextInputType.streetAddress,
                cursorColor: Theme.of(context).primaryColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16,
              ),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  AppLocalizations.addFreeboxSheetUploadFreeboxButtonLabel,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FreeboxImagePicker extends StatelessWidget {
  final double opacity;
  final Widget child;
  final bool isImageLoaded;
  final void Function() onPressed;
  FreeboxImagePicker({
    Key key,
    @required this.child,
    this.onPressed,
    this.opacity,
    this.isImageLoaded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Opacity(
          opacity: opacity,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 8,
            ),
            child: Container(
              color: isImageLoaded ? AppColors.white : Theme.of(context).primaryColor,
              height: 150,
              width: 150,
              child: child,
            ),
          ),
        ),
        TextButton.icon(
          onPressed: () async => await onPressed(),
          icon: Icon(MdiIcons.cameraEnhanceOutline),
          label: Text(AppLocalizations.addFreeboxSheetUploadImageButtonLabel),
        )
      ],
    );
  }
}
