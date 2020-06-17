import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../widgets.dart';

class LocationCardMol extends StatelessWidget {
  final IconData icon;
  final String title, detail, note;

  const LocationCardMol(
      {Key key,
      this.icon,
      @required this.title,
      @required this.detail,
      this.note})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildIcon(),
        SizedBox(width: Dimens.dp12),
        Expanded(
          child: _buildContent(),
        ),
      ],
    );
  }

  Widget _buildIcon() {
    if (icon != null) {
      return Container(
        padding: EdgeInsets.all(Dimens.dp4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primaryColor.withOpacity(0.1),
        ),
        child: Icon(
          icon,
          size: Dimens.dp16,
          color: AppColors.primaryColor,
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.all(Dimens.dp4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.black75Color.withOpacity(0.1),
        ),
        child: Icon(
          AppIcons.recent,
          size: Dimens.dp16,
          color: AppColors.black75Color,
        ),
      );
    }
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        H4Atm(
          title,
          style: TextStyle(
              color: AppColors.black4bColor, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: Dimens.dp12),
        H4Atm(
          detail,
          style: TextStyle(color: AppColors.black4bColor),
        ),
        _buildNote(),
      ],
    );
  }

  Widget _buildNote() {
    if (note != null) {
      return Padding(
        padding: const EdgeInsets.only(top: Dimens.dp8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(AppIcons.notes,
                size: Dimens.dp12, color: AppColors.black75Color),
            SizedBox(width: Dimens.dp8),
            H5Atm(
              note,
              style: TextStyle(color: AppColors.black75Color),
            )
          ],
        ),
      );
    } else {
      return SizedBox();
    }
  }
}
