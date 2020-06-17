import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../widgets.dart';
import '../info_product_mol.dart';

class OrderProductCardMol extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoProduct(),
          SizedBox(width: Dimens.dp12),
          H3Atm('1pcs'),
        ],
      ),
    );
  }

  Widget _buildInfoProduct() {
    return Expanded(child: InfoProductMol());
  }
}
