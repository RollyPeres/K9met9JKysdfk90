import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../atoms/atoms.dart';
import '../../molecules/molecules.dart';

class DeliveryStatusTemp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.black33Color),
        title: Text(
          'Dalam Pengiriman',
          style: TextStyle(color: AppColors.black33Color),
        ),
        backgroundColor: AppColors.supportShippedColor,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ScrollConfigAtm(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(Dimens.horizontalPadding),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _buildIdOrder(),
          SizedBox(height: Dimens.dp16),
          H2Atm('Caesar Candil'),
          SizedBox(height: Dimens.dp8),
          AddressCardMol(),
          SizedBox(height: Dimens.dp12),
          _buildProduct(),
          _buildActionButton(),
        ]),
      ),
    );
  }

  Widget _buildIdOrder() {
    return Align(
      alignment: AlignmentDirectional.topEnd,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            AppIcons.product,
            color: AppColors.black4bColor,
            size: Dimens.dp14,
          ),
          SizedBox(width: Dimens.dp2),
          H5Atm(
            'Order ID #945',
            style: TextStyle(color: AppColors.black4bColor),
          ),
        ],
      ),
    );
  }

  Widget _buildProduct() {
    return Row(
      children: [
        Expanded(
          child: H4Atm(
            'Martabak Mini\nTempe Mendoan 3',
            style: TextStyle(color: AppColors.black4bColor),
          ),
        ),
        H4Atm(
            'Rp. 80.000',
            style: TextStyle(color: AppColors.orangeColor),
          ),
      ],
    );
  }

  Widget _buildActionButton(){
    return Column(
        children: [
          Divider(height: Dimens.dp20),
          SizedBox(height: Dimens.dp4),
          Row(
            children: [
              Expanded(
                child: OutlineButtonAtm(
                    onPressed: () {
                      // TODO: action to call customer
                    },
                    smallPadding: true,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(AppIcons.chat, size: Dimens.dp16),
                        SizedBox(width: Dimens.dp4),
                        Expanded(child: H5Atm(Strings.contactCustomer)),
                      ],
                    )),
              ),
              SizedBox(width: Dimens.dp8),
              Expanded(
                child: PrimaryButtonAtm(
                    color: AppColors.blueColor,
                    smallPadding: true,
                    onPressed: () {
                      // TODO: action view order
                    },
                    child: Text('Pesanan Selesai')),
              )
            ],
          ),
        ],
      );
  }
}
