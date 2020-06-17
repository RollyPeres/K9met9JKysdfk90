import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../organisms/card/status_store_card_org.dart';
import '../../widgets.dart';

class HomeTemp extends StatefulWidget {
  @override
  _HomeTempState createState() => _HomeTempState();
}

class _HomeTempState extends State<HomeTemp> {
  bool _storeActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfigAtm(
        child: CustomScrollView(
          slivers: [
            HomeAppBarOrg(
              name: 'Toko Pak Raden',
              address:
                  'Jl. Buah Batu No.32 RT 2 RW 19,Kota Bandung, Jawa Barat 14045',
              urlImage: AssetsPaths.mockStoreImage,
              onTapNotification: () {},
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                SectionMol(
                  title: 'Status Toko',
                  child: StatusStoreCardOrg(
                    isActive: _storeActive,
                    onChange: (v) {
                      setState(() {
                        _storeActive = v;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(Dimens.dp16),
                  child: AlertMessageMol(
                    message:
                        'Belum ada produk yang terjual nih. Yuk, mulai jual produk dengan menekan tombol ',
                    higlightText: 'Tambah Produk',
                  ),
                ),
                SectionMol(
                    title: 'Kelola Transaksi',
                    child: GridView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: Dimens.width(context) ~/ 150,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 4,
                        childAspectRatio: 150/95,
                      ),
                      children: [
                        DashboardCardMol(
                          title: 'Pesanan Baru',
                          count: 4,
                          onPressed: () {},
                        ),
                        DashboardCardMol(
                          title: 'Pengiriman',
                          count: 9,
                          onPressed: () {},
                        ),
                      ],
                    )),
                SectionMol(title: 'Data Penjualan', child: TableSaleOrg()),
                SizedBox(height: 60),
              ]),
            ),
          ],
        ),
      ),
      floatingActionButton: FabAddProductMol(onPressed: () {
        Navigator.of(context).pushNamed(Routes.selectCategory);
      }),
    );
  }
}
