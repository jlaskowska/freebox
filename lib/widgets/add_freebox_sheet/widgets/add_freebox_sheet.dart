import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freebox/configs/app_colors.dart';
import 'package:freebox/localizations.dart';
import 'package:freebox/widgets/add_freebox_sheet/cubit/freebox_image_picker_cubit.dart';
import 'package:freebox/widgets/custom_circular_progress_indicator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AddFreeboxSheet extends StatefulWidget {
  AddFreeboxSheet({Key key}) : super(key: key);

  @override
  _AddFreeboxSheetState createState() => _AddFreeboxSheetState();
}

class _AddFreeboxSheetState extends State<AddFreeboxSheet> {
  @override
  Widget build(BuildContext context) {
    final _cubit = FreeboxImagePickerCubit();
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: BlocBuilder<FreeboxImagePickerCubit, FreeboxImagePickerState>(
            cubit: _cubit,
            builder: (context, state) {
              if (state is FreeboxImagePickerInitial) {
                return FreeboxImagePicker(
                  onPressed: () async => await _cubit.getImage(),
                  opacity: 0.4,
                  isImageLoaded: false,
                  child: Icon(
                    MdiIcons.cloudUploadOutline,
                  ),
                );
              } else if (state is FreeboxImagePickerLoaded) {
                return FreeboxImagePicker(
                  onPressed: () async => await _cubit.getImage(),
                  isImageLoaded: true,
                  opacity: 1,
                  child: Image.file(
                    _cubit.image,
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
    );
  }
}

class FreeboxImagePicker extends StatefulWidget {
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
  _FreeboxImagePickerState createState() => _FreeboxImagePickerState();
}

class _FreeboxImagePickerState extends State<FreeboxImagePicker> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Opacity(
          opacity: widget.opacity,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 8,
            ),
            child: Container(
              color: widget.isImageLoaded ? AppColors.white : Theme.of(context).primaryColor,
              height: 150,
              width: 150,
              child: widget.child,
            ),
          ),
        ),
        TextButton.icon(
          onPressed: () async => await widget.onPressed(),
          icon: Icon(MdiIcons.cameraEnhanceOutline),
          label: Text(AppLocalizations.addFreeboxSheetUploadImageButtonLabel),
        )
      ],
    );
  }
}
