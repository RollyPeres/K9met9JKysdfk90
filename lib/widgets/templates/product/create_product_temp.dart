import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../widgets.dart';

class CreateProductTemp extends StatefulWidget {
  @override
  _CreateProductTempState createState() => _CreateProductTempState();
}

class _CreateProductTempState extends State<CreateProductTemp> {
  var _imageProduct;
  var _satuan;
  bool _inStok = false;

  void _navigateToBack() {
    Navigator.of(context).maybePop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.detailProduct),
      ),
      body: _buildBody(),
      bottomNavigationBar: _buildActionButton(),
    );
  }

  Widget _buildBody() {
    return ScrollConfigAtm(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: Dimens.horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Dimens.dp14),
            _buildHeader(),
            _buildForm(),
            SizedBox(height: Dimens.dp14),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          width: 80,
          height: 80,
          child: FormImageMol(
            descText: Strings.upload,
            onChange: (val) {
              setState(() {
                _imageProduct = val;
              });
            },
            initialImage: _imageProduct,
          ),
        ),
        SizedBox(width: Dimens.dp16),
        _buildCategory(),
      ],
    );
  }

  Widget _buildCategory() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        H4Atm(
          Strings.category,
          style: TextStyle(color: AppColors.black75Color),
        ),
        SizedBox(height: Dimens.dp8),
        Row(
          children: [
            H3Atm(
              'Gets Food / Snack',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            IconButton(
              icon: Icon(AppIcons.edit,
                  color: AppColors.blackD8Color, size: Dimens.dp20),
              onPressed: _navigateToBack,
            )
          ],
        ),
      ],
    );
  }

  Widget _buildForm() {
    return Column(children: [
      SizedBox(height: Dimens.dp20),
      FormInputMol(label: 'Nama Produk'),
      FormInputMol(
        label: 'Harga Produk (Rp)',
        inputType: TextInputType.number,
      ),
      FormInputMol(
        label: 'Harga Promo (Rp)',
        inputType: TextInputType.number,
      ),
      FormInputAreaMol(label: 'Deskripsi Produk'),
      Row(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: FormInputMol(
              label: 'Berat',
              inputType: TextInputType.number,
            ),
          ),
          SizedBox(width: Dimens.dp12),
          Flexible(
            fit: FlexFit.loose,
            child: FormDropdownMol(
              hintText: 'Satuan',
              data: ['Gram', 'Kg', 'Liter', 'Satuan', 'Pack'],
              onChange: (v) {
                setState(() {
                  _satuan = v;
                });
              },
              value: _satuan,
            ),
          )
        ],
      ),
      FormSwitchMol(
          label: 'Status Stok',
          statusText: _inStok ? 'Di Jual' : 'Tidak di Jual',
          value: _inStok,
          onChange: (v) {
            setState(() {
              _inStok = v;
            });
          })
    ]);
  }

  Widget _buildActionButton(){
    return Container(
      height: 63,
      padding: EdgeInsets.fromLTRB(Dimens.dp16, 0, Dimens.dp16, Dimens.dp16),
      child: PrimaryButtonAtm(
          onPressed: (){},
          child: Text(Strings.save)),
    );
  }
}
