import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../widgets.dart';

class ProductTemp extends StatefulWidget {
  @override
  _ProductTempState createState() => _ProductTempState();
}

class _ProductTempState extends State<ProductTemp> {
  
  void _navigateToNewProduct(){
    Navigator.of(context).pushNamed(Routes.selectCategory);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(Strings.product),
      ),
      body: Container(
        child: Column(
          children: [
            _buildHeader(),
            _buildBody(),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Expanded(
      child: ScrollConfigAtm(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Dimens.horizontalPadding),
          child: ListProductCardOrg(),
        ),
      )),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(Dimens.dp12),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.blackD8Color))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FabAddProductMol(onPressed: _navigateToNewProduct),
          SizedBox(width: Dimens.dp12),
          FabAddProductMol(
            onPressed: () {},
            color: AppColors.whiteF2Color,
            child: Text(
              Strings.allProduct,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: AppColors.black75Color),
            ),
          ),
        ],
      ),
    );
  }
}
