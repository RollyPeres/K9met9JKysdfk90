import 'package:flutter/material.dart';
import 'package:gets_seller/shared/shared.dart';

import '../widgets.dart';

class TableSaleOrg extends StatelessWidget {
  final VoidCallback onPressMore;

  const TableSaleOrg({Key key, this.onPressMore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _buildText(),
      SizedBox(height: Dimens.dp12),
      _buildTable(),
    ]);
  }

  Widget _buildText() {
    return Row(
      children: [
        Column(children: [
          H4Atm('Produk Terjual'),
          SizedBox(height: Dimens.dp4),
          H1Atm('16'),
        ]),
        Spacer(),
        InkWell(
          onTap: onPressMore,
          child: H4Atm(
            'Selengkapnya',
            style: TextStyle(color: AppColors.primaryColor),
          ),
        )
      ],
    );
  }

  Widget _buildTable() {
    return ScrollConfigAtm(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: <DataColumn>[
            DataColumn(label: Text("Order ID")),
            DataColumn(label: Text("Product")),
            DataColumn(label: Text("Jumlah")),
            DataColumn(label: Text("Harga")),
          ],
          rows: <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(Text("#2397")),
                DataCell(Text("Martabak Mini\nTempe Medona")),
                DataCell(Text("1\n3")),
                DataCell(Text("Rp. 80.000")),
              ],
            ),DataRow(
              cells: <DataCell>[
                DataCell(Text("#2397")),
                DataCell(Text("Martabak Mini\nTempe Medona")),
                DataCell(Text("1\n3")),
                DataCell(Text("Rp. 80.000")),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text("#2397")),
                DataCell(Text("Martabak Mini\nTempe Medona")),
                DataCell(Text("1\n3")),
                DataCell(Text("Rp. 80.000")),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text("#2397")),
                DataCell(Text("Martabak Mini\nTempe Medona")),
                DataCell(Text("1\n3")),
                DataCell(Text("Rp. 80.000")),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text("#2397")),
                DataCell(Text("Martabak Mini\nTempe Medona")),
                DataCell(Text("1\n3")),
                DataCell(Text("Rp. 80.000")),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text("#2397")),
                DataCell(Text("Martabak Mini\nTempe Medona")),
                DataCell(Text("1\n3")),
                DataCell(Text("Rp. 80.000")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
