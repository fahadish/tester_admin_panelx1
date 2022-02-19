import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:provider/provider.dart';
import 'package:tester_admin_panel/Providers/core_providers.dart';
import 'package:tester_admin_panel/views/OrderScreen/map_utils.dart';
import 'package:tester_admin_panel/views/OrderScreen/order_data_table.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  var height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    {

      return Consumer<CoreProviders>(builder: (context,appPro,_){
        var gst = appPro.orderDetailsModel!.data!.order[0].gstTax;
        var newG = gst!.split('.')[0];
        var total = appPro.orderDetailsModel!.data!.order[0].orderTotal;
        var newt = total!.split('.')[0];
        var gst1 = int.parse(newG);
        var total1 = int.parse(newt);

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text(
              'Order Details',
              style: TextStyle(color: Colors.black),
            ),
            iconTheme: const IconThemeData(color: Colors.black),
            elevation: 5,
            backgroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: height * 0.06,
                    width: width,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        border: Border.all(color: Colors.black, width: 0.1)),
                    child:  Center(
                      child: Text(
                        ' Order Num: ${appPro.orderDetailsModel!.data!.order[0].orderNumber}',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: height * 0.01,
                  // ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                            height: height*0.2,
                            width: width / 2,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Date:\nTime:    ',
                                        style:
                                        TextStyle(fontSize: height * 0.015),
                                      ),
                                      Flexible(
                                        child: Text(
                                          '${appPro.orderDetailsModel!.data!.order[0].orderDate}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: height * 0.015),
                                        ),
                                      )
                                      ,
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'DeliveryArea:  ',
                                        style:
                                        TextStyle(fontSize: height * 0.015),
                                      ),
                                      Expanded(
                                        child: Text(
                                          '${appPro.orderDetailsModel!.data!.order[0].userDeliveryArea}',
                                          maxLines: 3,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: height * 0.015),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Address:  ',
                                        style:
                                        TextStyle(fontSize: height * 0.015),
                                      ),
                                      Flexible(
                                        child: Text('${appPro.orderDetailsModel!.data!.order[0].userAddress}',
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: height * 0.015)),
                                      )
                                    ],
                                  ),
                                )
                                ,
                              ],
                            )),
                        Container(
                            height: height*0.2,
                            width: width / 2,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Name:  ',
                                        style:
                                        TextStyle(fontSize: height * 0.015),
                                      ),
                                      Text('${appPro.orderDetailsModel!.data!.order[0].userName}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: height * 0.015),
                                      )
                                      ,
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Email:  ',
                                        style:
                                        TextStyle(fontSize: height * 0.015),
                                      ),
                                      Expanded(
                                        child: Text(
                                          '${appPro.orderDetailsModel!.data!.order[0].userEmail}',
                                          maxLines: 3,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: height * 0.015),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Phone:  ',
                                        style:
                                        TextStyle(fontSize: height * 0.015),
                                      ),
                                      Text('${appPro.orderDetailsModel!.data!.order[0].userPhone}',
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: height * 0.015))
                                    ],
                                  ),
                                )
                                ,
                              ],
                            )),
                      ],
                    ),
                  ),

                  SizedBox(
                      height: height * 0.34, // height: height*0.35,width: width*0.9,
                      child: OrderDataTable()
                  ),
Container(height: 120,color: Colors.yellow,
child: Table(border: TableBorder.all(color: Colors.red),
children: [],
),
),
                  
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            child: ElevatedButton.icon(
                              icon: const Icon(
                                Icons.pending_actions,
                                color: Colors.white,
                                size: 14.0,
                              ),
                              label: const Text(
                                'Pending',
                                style: TextStyle(letterSpacing: 1),
                              ),
                              onPressed: () async{
                              },
                              style: ElevatedButton.styleFrom(
                                primary: const Color(0xffD9005E),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            )),
                        Container(
                            child: ElevatedButton.icon(
                              icon: const Icon(
                                Icons.call,
                                color: Colors.white,
                                size: 14.0,
                              ),
                              label: const Text('Call'),
                              onPressed: () {
                                FlutterPhoneDirectCaller.callNumber(
                                    '01223948848723');
                              },

                              //

                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            )),
                        Container(
                            child: ElevatedButton.icon(
                              icon: const Icon(
                                Icons.location_on,
                                color: Colors.white,
                                size: 14.0,
                              ),
                              label: const Text(
                                'Location',
                                style: TextStyle(letterSpacing: 1),
                              ),
                              onPressed: () {
                                MapUtils.openMap(31.582045, 74.329376);
                                // MapUtils.openMap(31.582045, 74.329376);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.amberAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },);
    }
  }
}

// Container(child: Padding(
// padding: const EdgeInsets.all(10.0),
// child: Column(  children: [Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Text('Total Unit Price',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
// RichText(
// text:  TextSpan(
// style: const TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.w500),
// children: <TextSpan>[
// TextSpan(
// text: 'Rs: ',
// style:
// TextStyle()),
// TextSpan(text: '${appPro.orderDetailsModel!.data!.order[0].orderTotal}', style: TextStyle(color: Colors.pink.shade200,fontSize: 20,fontWeight: FontWeight.w500))
// ],
// ),
// )
//
// ],)],),
// ),),
// Container(child: Padding(
// padding: const EdgeInsets.all(10.0),
// child: Column(  children: [Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Text('General Sales Tax${appPro.orderDetailsModel!.data!.order[0].gstTaxPercent}%',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
// RichText(
// text:  TextSpan(
// style: const TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.w500),
// children: <TextSpan>[
// TextSpan(
// text: 'Rs: ',
// style:
// TextStyle()),
// TextSpan(text: '${appPro.ordersModel!.data!.orders![0].gstTax}', style: TextStyle(color: Colors.pink.shade200,fontSize: 20,fontWeight: FontWeight.w500))
// ],
// ),
// )
//
// ],)],),
// ),),
// Container(child: Padding(
// padding: const EdgeInsets.all(10.0),
// child: Column(  children: [Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Text('Total Price',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
// RichText(
// text:  TextSpan(
// style: const TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.w500),
// children: <TextSpan>[
// TextSpan(
// text: 'Rs: ',
// style:
// TextStyle()),
// TextSpan(text: '${gst1+total1+1}', style: TextStyle(color: Colors.pink.shade200,fontSize: 20,fontWeight: FontWeight.w500))
// ],
// ),
// )
//
// ],)],),
// ),),