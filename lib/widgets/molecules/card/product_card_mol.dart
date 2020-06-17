import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../atoms/image/product_image_atm.dart';
import '../../atoms/texts/texts.dart';

class ProductCardMol extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(Dimens.dp6, Dimens.dp6, 0 ,Dimens.dp10),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: Shadows.primaryShadow,
          borderRadius: BorderRadius.circular(Dimens.roundCard)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          ProductImageAtm(
            width: null,
            height: Dimens.minSizeCardProduct,
            radius:
                BorderRadius.vertical(top: Radius.circular(Dimens.roundCard)),
          ),
          _buildInfo(),
        ],
      ),
    );
  }

  Widget _buildInfo() {
    return Container(
      padding: const EdgeInsets.all(Dimens.dp8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          H5Atm(
            'Martabark Keju Mini',
            style: TextStyle(
                fontWeight: FontWeight.w600, color: AppColors.black33Color),
          ),
          SizedBox(height: Dimens.dp4),
          Row(
            children: [
              Expanded(
                child: H4Atm(
                  'Rp. 24.000',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.black33Color),
                ),
              ),
              IconButton(
                padding: EdgeInsets.all(Dimens.dp4),
                iconSize: 4,
                constraints: BoxConstraints(
                  maxWidth: kMinInteractiveDimension,
                  minWidth: 30,
                  maxHeight: 20,
                ),
                icon: Icon(AppIcons.more),
                onPressed: (){},
              ),
            ],
          )
        ],
      ),
    );
  }
}
