import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:provider/provider.dart';
import 'package:tester_admin_panel/Providers/core_providers.dart';

class OrderDataTable extends StatefulWidget {
  OrderDataTable({Key? key}) : super(key: key);

  @override
  State<OrderDataTable> createState() => _OrderDataTableState();
}

class _OrderDataTableState extends State<OrderDataTable> {
  var height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    {}
    return Consumer<CoreProviders>(
      builder: (context, appPro, _) {
        var gst = appPro.orderDetailsModel!.data!.order[0].gstTax;
        var newG = gst!.split('.')[0];
        var total = appPro.orderDetailsModel!.data!.order[0].orderTotal;
        var newt = total!.split('.')[0];
        var gst1 = int.parse(newG);
        var total1 = int.parse(newt);
        int index1 = -1;
        int i = 1;
        int sum = total1 + gst1 + 1;
        for (i; i <= appPro.orderDetailsModel!.data!.orderDetail.length; i++) {
          appPro.orderDetailsModel!.data!.orderDetail.length;
// var index2 = index1++;
          index1++;
          print('show index ${index1}');

          print(
              ' Show the length ${appPro.orderDetailsModel!.data!.orderDetail.length}');
        }
        return Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Image'),
                    Text('Name'),
                    Text('Quantity'),
                    Text('Unit Price'),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.28,
                child: ListView.builder(
                    itemCount:
                        appPro.orderDetailsModel!.data!.orderDetail.length,
                    itemBuilder: (context, index) {
                      return Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Table(
                            border: TableBorder.all(),
                            children: [
                              TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          '${appPro.orderDetailsModel!.data!.orderDetail[index].image}',
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) =>
                                          new CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          new Icon(Icons.error),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text(
                                      ' ${appPro.orderDetailsModel!.data!.orderDetail[index].productName}',
                                      maxLines: 4,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text(
                                      ' ${appPro.orderDetailsModel!.data!.orderDetail[index].quantity}',
                                      maxLines: 4,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text(
                                      ' ${appPro.orderDetailsModel!.data!.orderDetail[index].price}',
                                      maxLines: 4,
                                    ),
                                  ),
                                ),
                              ]),
                            ],
                          ),
                        )
                      ]);
                    }),
              )
            ],
          ),
        );
      },
    );
  }
}

//
//
// body: Container(
// child: DataTable(columnSpacing: 30,
// columns: [
// DataColumn(label: Text('Image')),
// DataColumn(label: Text('Name')),
// DataColumn(label: Text('Quantity'),
// ),
// DataColumn(label: Text('Unit\nPrice'),),
// DataColumn(label: Text('Total'),)
//
// ],
// rows: [
// DataRow(cells: [
// DataCell(Container(
//
// child: CachedNetworkImage(imageUrl: '${appPro.orderDetailsModel!.data!.orderDetail[index1].image}',fit:BoxFit.fill,
//
// placeholder: (context, url) => new CircularProgressIndicator(),
// errorWidget: (context, url, error) => new Icon(Icons.error),
//
// ) ,)),
// DataCell(Text(' ${appPro.orderDetailsModel!.data!.orderDetail[index1].productName}',maxLines: 4,)),
// DataCell(Text(' ${appPro.orderDetailsModel!.data!.orderDetail[index1].quantity}',maxLines: 4,)),
// DataCell(Text(' ${appPro.orderDetailsModel!.data!.orderDetail[index1].price}',maxLines: 4,)),
// DataCell(Container()),
// ]),
//
//
// DataRow(cells: [
// DataCell(Text('')),
// DataCell(Container()),
// DataCell(Container()),
// DataCell(Container()),
// DataCell(Container()),
// ]),
//
// DataRow(cells: [
// DataCell(Container()),
// DataCell(Container()),
// DataCell(Container()),
// DataCell(Text('Gst: ${appPro.orderDetailsModel!.data!.order[0].gstTaxPercent}%',maxLines: 4,)),
// DataCell(Text(' ${appPro.orderDetailsModel!.data!.order[0].gstTax}',maxLines: 4,)),
// ]),
// DataRow(cells: [
// DataCell(Container()),
// DataCell(Container()),
// DataCell(Container()),
// DataCell(Text('Next Total',maxLines: 1,)),
// DataCell(Text('${sum}')),
// ]),
// ],
// ),
// ),
