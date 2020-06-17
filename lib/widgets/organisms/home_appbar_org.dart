import 'package:flutter/material.dart';

import '../../shared/shared.dart';
import '../atoms/atoms.dart';
import '../molecules/molecules.dart';

class HomeAppBarOrg extends SliverAppBar {
  final String urlImage, name, address;
  final VoidCallback onTapNotification;

  HomeAppBarOrg({
    @required this.urlImage,
    @required this.name,
    @required this.address,
    this.onTapNotification,
  }) : super(
          automaticallyImplyLeading: false,
          expandedHeight: 130,
          pinned: true,
          actions: [
            IconButton(
              icon: Icon(AppIcons.notification),
              onPressed: onTapNotification,
            )
          ],
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            background: _buildContent(name, address, urlImage),
          ),
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(Dimens.dp20))),
        );

  static Widget _buildContent(String name, String address, String imageUrl) {
    return Stack(
      children: [
        Positioned(
            top: 0,
            right: 0,
            child: Image.asset(AssetsPaths.corakHeader, height: 100)),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: Dimens.horizontalPadding, vertical: Dimens.dp20),
            child: Row(
              children: [
                CircleImageMol(
                  image: NetworkImage(imageUrl),
                  size: 80,
                ),
                SizedBox(width: Dimens.dp16),
                _buildDescription(name, address),
              ],
            ),
          ),
        ),
      ],
    );
  }

  static Widget _buildDescription(String name, String address) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: Dimens.dp32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            H3Atm(
              name,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: Dimens.dp4),
            H4Atm(
              address,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
