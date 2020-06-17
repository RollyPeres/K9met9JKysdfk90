import 'package:flutter/material.dart';

import '../../../../shared/shared.dart';
import '../../../widgets.dart';

class StoreOwnerFormTemp extends StatefulWidget {
  @override
  _StoreOwnerFormTempState createState() => _StoreOwnerFormTempState();
}

class _StoreOwnerFormTempState extends State<StoreOwnerFormTemp> {

  FocusNode _nameFocusNode = FocusNode();
  FocusNode _ktpFocusNode = FocusNode();
  FocusNode _telponFocusNode = FocusNode();
  FocusNode _domisiliFocusNode = FocusNode();

  var _imageKTP;

  _requestNextFocus(FocusNode newFocus){
    FocusScope.of(context).nextFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: Dimens.dp8,
          color: AppColors.whiteF9Color,
        ),
        _buildForm(),
      ],
    );
  }

  Widget _buildForm(){
    return Padding(
      padding: EdgeInsets.all(Dimens.horizontalPadding),
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildPadding(6),
          FormInputMol(
            label: 'Nama Lengkap',
            focusNode: _nameFocusNode,
            onSubmit: (v) {
              _requestNextFocus(_ktpFocusNode);
            },
            inputAction: TextInputAction.next,
          ),
          _buildPadding(),
          FormInputMol(
            label: 'Nomor KTP',
            focusNode: _ktpFocusNode,
            inputType: TextInputType.number,
            onSubmit: (_) => _requestNextFocus(_telponFocusNode),
            inputAction: TextInputAction.next,
          ),
          _buildPadding(),
          FormInputMol(
            label: 'Nomor Telpon',
            focusNode: _telponFocusNode,
            inputType: TextInputType.number,
            onSubmit: (_) => _requestNextFocus(_domisiliFocusNode),
            inputAction: TextInputAction.next,
          ),
          _buildPadding(),
          FormInputMol(
            label: 'Alamat domisili',
            focusNode: _domisiliFocusNode,
          ),
          _buildPadding(),
          FormImageMol(
            height: 150,
            initialImage: _imageKTP,
            onChange: (file) {
              setState(() {
                _imageKTP = file;
              });
            },
            descText: 'Ambil Foto KTP Anda',
            label: 'Foto KTP Anda',
          ),
          _buildPadding(62),
        ],
      ),
    );
  }

  Widget _buildPadding([double v]){
    return SizedBox(height: v ?? Dimens.dp12);
  }
}