import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../shared/shared.dart';
import '../../widgets.dart';

class DetailOrderTemp extends StatefulWidget {
  @override
  _DetailOrderTempState createState() => _DetailOrderTempState();
}

class _DetailOrderTempState extends State<DetailOrderTemp> {
  void _navigateToDeliveryStatus() {
    Navigator.pushNamed(context, Routes.deliveryStatus);
  }

  void _navigateToMaps() async{
    var url = 'https://maps.google.com';
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.orderDetail),
      ),
      body: _buildBody(),
      bottomNavigationBar: _buildButtonAction(),
    );
  }

  Widget _buildBody() {
    return ScrollConfigAtm(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SectionMol(child: PropertyOrderCardMol()),
            SectionMol(
              title: Strings.shippingAddress,
              child: Column(
                children: [
                  AddressCardMol(),
                  SizedBox(height: Dimens.dp12),
                  _buildActionAddress(),
                ],
              ),
            ),
            SectionMol(
              title: Strings.order,
              child: ListOrderProductOrg(),
            ),
            SectionMol(
                title: Strings.paymentDetails,
                child: DetailsPaymentOrderCardMol()),
            SectionMol(child: PaymentMethodOrderMol()),
            SizedBox(height: Dimens.dp32)
          ],
        ),
      ),
    );
  }

  Widget _buildButtonAction() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Divider(color: AppColors.primaryColor, height: 1),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimens.horizontalPadding),
          child: SecondaryButtonAtm(
            onPressed: () {
              // TODO: action decline order
            },
            color: AppColors.redErrorColor,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(AppIcons.close, size: Dimens.dp16),
                SizedBox(width: Dimens.dp12),
                H3Atm(Strings.rejectOrder),
              ],
            ),
          ),
        ),
        Divider(height: Dimens.dp16),
        Padding(
          padding: EdgeInsets.fromLTRB(Dimens.horizontalPadding, 0,
              Dimens.horizontalPadding, Dimens.horizontalPadding),
          child: SwipeButtonOrg(
            text: Strings.acceptAndSendOrder,
            onChanged: (p) {
              // TODO: action accept order
            },
          ),
        )
      ],
    );
  }

  Widget _buildActionAddress() {
    return Row(
      children: [
        Expanded(
          child: OutlineButtonAtm(
              onPressed: () {
                // TODO: action call customer
              },
              smallPadding: true,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(AppIcons.chat, size: Dimens.dp16),
                  SizedBox(width: Dimens.dp4),
                  H5Atm(Strings.contactCustomer),
                ],
              )),
        ),
        SizedBox(width: Dimens.dp24),
        Expanded(
          child: OutlineButtonAtm(
              color: AppColors.blueColor,
              smallPadding: true,
              onPressed: _navigateToMaps,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(AppIcons.target_location, size: Dimens.dp16),
                  SizedBox(width: Dimens.dp4),
                  H5Atm(Strings.viewLocationMap),
                ],
              )),
        ),
      ],
    );
  }
}
