import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../atoms/texts/texts.dart';

class StatusStoreCardOrg extends StatefulWidget {
  final bool isActive;
  final ValueChanged<bool> onChange;

  const StatusStoreCardOrg({
    Key key,
    @required this.isActive,
    @required this.onChange,
  }) : super(key: key);

  @override
  _StatusStoreCardOrgState createState() => _StatusStoreCardOrgState();
}

class _StatusStoreCardOrgState extends State<StatusStoreCardOrg> {
  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }

  Widget _buildContent() {
    return Row(
      children: [
        _buildMessage(),
        SizedBox(width: Dimens.dp16),
        _buildHandleActive(),
      ],
    );
  }

  Widget _buildMessage() {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          H4Atm(
            'Atur Status Toko Anda',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: Dimens.dp8),
          H4Atm(
            'Silahkan atur jam operasional toko Anda disini',
            style: TextStyle(color: AppColors.disabledTextColor),
          ),
        ],
      ),
    );
  }

  Widget _buildHandleActive() {
    return Expanded(
      child: Container(
        color: Colors.transparent,
        alignment: AlignmentDirectional.centerEnd,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            H3Atm(
              widget.isActive ? 'Toko Buka' : 'Toko Tutup',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            Switch(value: widget.isActive, onChanged: widget.onChange),
          ],
        ),
      ),
    );
  }
}
