import 'package:flutter/material.dart';

import '../../shared/shared.dart';

class OrderTabBarMol extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TabBar(
          indicatorColor: AppColors.primaryColor,
          labelColor: AppColors.primaryColor,
          unselectedLabelColor: AppColors.blackD8Color,
          isScrollable: true,      
          physics: BouncingScrollPhysics(),
          tabs: [
            Tab(child: Text(Strings.allOrder)),
            Tab(child: Text(Strings.newOrder)),
            Tab(child: Text(Strings.orderShipped)),
            Tab(child: Text(Strings.orderComplete)),
            Tab(child: Text(Strings.orderDeclined)),
          ],
        ),
        Divider(
          height: 1,
          color: AppColors.blackD8Color,
        ),
      ],
    );
  }
}
