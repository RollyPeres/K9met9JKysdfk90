import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../widgets.dart';

class LocationSheetTemp extends StatefulWidget {
  @override
  _LocationSheetTempState createState() => _LocationSheetTempState();
}

class _LocationSheetTempState extends State<LocationSheetTemp> {
  bool isSearch = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimens.height(context) * 0.95,
      child: BaseContentSheetMol(
        child: Container(
          height: (Dimens.height(context) * 0.95) - 35,
          child: ScrollConfigAtm(
            child: ListView(
              shrinkWrap: true,
              children: [
                _buildHeader(),
                SingleChildScrollView(child: _buildContent()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return isSearch
        ? SearchLocationTemp(
            tappedSelectMap: (v) {
              setState(() {
                isSearch = !v;
              });
            },
          )
        : SelectLocationTemp();
  }

  Widget _buildHeader() {
    return Row(
      children: [
        H4Atm('Pilih Lokasi Toko'),
        Spacer(),
        _buildSearchButton(),
      ],
    );
  }

  Widget _buildSearchButton() {
    if (!isSearch) {
      return IconButton(
        icon: Icon(
          AppIcons.search,
          color: AppColors.black75Color,
          size: Dimens.dp18,
        ),
        onPressed: () {
          setState(() {
            isSearch = !isSearch;
          });
        },
      );
    } else {
      return SizedBox();
    }
  }
}
