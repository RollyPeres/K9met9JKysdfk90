import 'package:flutter/material.dart';

import '../../../../shared/shared.dart';
import '../../../widgets.dart';

class StoreFormTemp extends StatefulWidget {
  @override
  _StoreFormTempState createState() => _StoreFormTempState();
}

class _StoreFormTempState extends State<StoreFormTemp> {
  FocusNode _nameFocusNode = FocusNode();
  FocusNode _nomorFocusNode = FocusNode();
  FocusNode _addressFocusNode = FocusNode();

  var _imageToko;

  _requestNextFocus(FocusNode newFocus) {
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

  Widget _buildForm() {
    return Container(
        margin: EdgeInsets.all(Dimens.horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FormInputMol(
              label: 'Nama Toko',
              inputAction: TextInputAction.next,
              focusNode: _nameFocusNode,
              onSubmit: (_) => _requestNextFocus(_nomorFocusNode),
            ),
            SizedBox(height: 12),
            FormInputMol(
              label: 'Nomor WhatsApp Toko',
              inputAction: TextInputAction.next,
              inputType: TextInputType.phone,
              focusNode: _nomorFocusNode,
              onSubmit: (_) => _requestNextFocus(_addressFocusNode),
            ),
            SizedBox(height: 12),
            FormInputAreaMol(
              label: 'Alamat Lengkap',
              minLine: 5,
              focusNode: _addressFocusNode,
            ),
            SizedBox(height: 12),
            FormInputMol(
              label: 'Deskripsi Toko',
              focusNode: _addressFocusNode,
            ),
            SizedBox(height: 12),
            FormImageMol(
              label: 'Foto Toko Anda',
              descText: 'Ambil Foto Toko Anda',
              height: 150,
              initialImage: _imageToko,
              onChange: (file) {
                setState(() {
                  _imageToko = file;
                });
              },
            ),
            SizedBox(height: 62)
          ],
        ));
  }
}
