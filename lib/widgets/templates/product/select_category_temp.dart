import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../widgets.dart';

class SelectCategoryTemp extends StatefulWidget {
  @override
  _SelectCategoryTempState createState() => _SelectCategoryTempState();
}

class _SelectCategoryTempState extends State<SelectCategoryTemp> {
  var _groupValue = 0;

  void _onChangeCategory(dynamic val) {
    setState(() {
      _groupValue = val;
    });
  }

  void _navigateToCreateProduct(){
    Navigator.pushNamed(context, Routes.createProduct);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.back),
      ),
      body: _buildBody(),
      bottomNavigationBar: _buildButtonAction(),
    );
  }

  Widget _buildBody() {
    return ScrollConfigAtm(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: Dimens.horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          _buildHeader(),
          SizedBox(height: Dimens.dp16),
          _buildSelectForm(),
        ]),
      ),
    );
  }

  List<Widget> _radioGroup() {
    return [
      FormRadioMol(
        groupValue: _groupValue,
        value: 0,
        label: 'Makanan Ringan',
        onChange: _onChangeCategory,
      ),
      FormRadioMol(
        groupValue: _groupValue,
        value: 1,
        label: 'Makanan Berat',
        onChange: _onChangeCategory,
      ),
      FormRadioMol(
        groupValue: _groupValue,
        value: 2,
        label: 'Snack',
        onChange: _onChangeCategory,
      ),
      FormRadioMol(
        groupValue: _groupValue,
        value: 3,
        label: 'Frozen Food',
        onChange: _onChangeCategory,
      ),
    ];
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimens.dp12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          H3Atm(
            Strings.category,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          H5Atm(Strings.selectCategoryProduct),
        ],
      ),
    );
  }

  Widget _buildSelectForm() {
    return Column(
      children: [
        FormRadioGroupMol(
          label: 'Gets Food',
          items: _radioGroup(),
        ),
        FormRadioGroupMol(
          label: 'Gets Daily',
          items: _radioGroup(),
        ),
        FormRadioGroupMol(
          label: 'Gets Service',
          items: _radioGroup(),
        ),
        FormRadioGroupMol(
          label: 'Gets Fresh',
          items: _radioGroup(),
        ),
      ],
    );
  }

  Widget _buildButtonAction() {
    return Container(
      height: 63,
      padding: EdgeInsets.fromLTRB(Dimens.dp16, 0, Dimens.dp16, Dimens.dp16),
      child: PrimaryButtonAtm(
          onPressed: _navigateToCreateProduct,
          child: Text(Strings.next)),
    );
  }
}
