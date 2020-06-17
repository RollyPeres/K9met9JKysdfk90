import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../shared/shared.dart';
import '../../widgets.dart';

class FormImageMol extends StatefulWidget {
  final String label, descText;
  final File initialImage;
  final ValueChanged<File> onChange;
  final Color color;
  final ImageSource imageSource;
  final double height;

  const FormImageMol({
    Key key,
    this.label,
    this.initialImage,
    @required this.onChange,
    this.color = AppColors.primaryColor,
    this.descText = Strings.pickImage,
    this.imageSource = ImageSource.camera,
    this.height = 80,
  }) : super(key: key);

  @override
  _FormImageMolState createState() => _FormImageMolState();
}

class _FormImageMolState extends State<FormImageMol> {
  File _image;
  final picker = ImagePicker();

  @override
  void initState() {
    if (widget.initialImage != null) {
      setState(() {
        _image = widget.initialImage;
      });
    }
    super.initState();
  }

  Future _pickImage() async {
    var imagePick =
        await picker.getImage(source: widget.imageSource ?? ImageSource.camera);
    if (imagePick != null) {
      setState(() {
        _image = File(imagePick.path);
      });
      widget.onChange(_image);
    }
  }

  Future<void> _retriveLostData() async {
    final LostData response = await picker.getLostData();
    if (response.isEmpty) {
      return;
    }

    if (response.file != null) {
      if (response.type == RetrieveType.image) {
        setState(() {
          _image = File(response.file.path);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildLabel(),
        _image?.path != null ? _buildImage() : _buildInput(),
      ],
    );
  }

  Widget _buildInput() {
    return InkWell(
      onTap: _pickImage,
      child: DashedBorderMol(
        color: widget.color,
        child: Padding(
          padding: EdgeInsets.all(Dimens.dp16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                AppIcons.camera,
                color: widget.color,
                size: Dimens.dp24,
              ),
              SizedBox(height: Dimens.dp4),
              H3Atm(
                widget.descText,
                style: TextStyle(color: widget.color),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel() {
    if (widget.label != null) {
      return Padding(
        padding: EdgeInsets.only(bottom: Dimens.paddingLabelText),
        child: H4Atm(
          widget.label,
          style: TextStyle(color: AppColors.black4bColor),
        ),
      );
    } else {
      return SizedBox();
    }
  }

  Widget _buildImage() {
    return FutureBuilder(
      future: _retriveLostData(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return InkWell(
            onTap: _pickImage,
            child: Container(
              height: widget.height,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Dimens.roundCard),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  overflow: Overflow.clip,
                  fit: StackFit.expand,
                  children: [
                    Image.file(_image, fit: BoxFit.cover),
                    Container(color: Colors.black.withOpacity(0.4)),
                    Center(
                      child: H4Atm(
                        'Ubah',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        } else {
          return Center(child: Text('Wait..'));
        }
      },
    );
  }
}
