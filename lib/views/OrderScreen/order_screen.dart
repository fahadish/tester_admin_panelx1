// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tester_admin_panel/Providers/core_providers.dart';
import 'package:tester_admin_panel/controller/homescreen_controller.dart';
import 'package:tester_admin_panel/views/DashboardScreen/dashboard_screen.dart';
import 'package:tester_admin_panel/views/OrderScreen/orderDetails.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({Key? key}) : super(key: key);
  var height, width;
  PageController controller=PageController(initialPage: 0);
  @override
  Widget build(
    BuildContext context,
  ) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    final size = MediaQuery.of(context).size;
    return Consumer<CoreProviders>(builder: (context,appPro,_){
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 5,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            'My Orders',
            style: TextStyle(color: Colors.black),

          ),
          leading: InkWell(
              onTap: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context)=>DashBoardScreen()
                ));
              },
              child: const Icon(Icons.arrow_back)),

        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          appPro.getCheck1();
                          print(appPro.check1);
                          controller.animateToPage(0, duration: const Duration(milliseconds: 200), curve: Curves.bounceIn);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: size.height*0.06,
                          decoration: BoxDecoration(
                              color: appPro.check1?Colors.pink.shade200:Colors.white,
                              border: Border.all(width: 1,color: appPro.check1?Colors.white:Colors.grey),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text('All',style: TextStyle(
                              color: appPro.check1?Colors.white:Colors.black,
                              fontSize: size.height*0.017
                          ),),
                        ),
                      ),
                    ),
                    SizedBox(width: size.width*0.01,),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          appPro.getCheck2();
                          controller.animateToPage(1, duration: const Duration(milliseconds: 200), curve: Curves.bounceIn);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: size.height*0.06,
                          decoration: BoxDecoration(
                              color: appPro.check2?Colors.pink.shade200:Colors.white,
                              border: Border.all(width: 1,color:appPro.check2?Colors.white:Colors.grey),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text('Pending',style: TextStyle(
                              color: appPro.check2?Colors.white:Colors.black,
                              fontSize: size.height*0.017
                          ),),
                        ),
                      ),
                    ),
                    SizedBox(width: size.width*0.01,),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          appPro.getCheck3();
                          controller.animateToPage(2, duration: const Duration(milliseconds: 200), curve: Curves.bounceIn);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: size.height*0.06,
                          decoration: BoxDecoration(
                              color: appPro.check3?Colors.pink.shade200:Colors.white,
                              border: Border.all(width: 1,color: appPro.check3?Colors.white:Colors.grey),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text('Completed',style: TextStyle(
                              color: appPro.check3?Colors.white:Colors.black,
                              fontSize: size.height*0.017
                          ),),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: controller,
                    children: [
                      ListView.builder(
                          itemCount: appPro.ordersModel!.data!.orders!.length,
                          itemBuilder: (context, index) {
                            return getMyOrdersContainer(appPro,index,context,size);
                          }),
                      const Text('Pending'),
                      const Text('completed'),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  getMyOrdersContainer(CoreProviders appPro, int index,BuildContext context,size) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            BannerRepo().getOrderDetails(context,appPro.ordersModel!.data!.orders![index].orderId).then((value){
              Get.to(OrderDetails());
            });
          },
          child: Container(
            width: width * 0.90,
            height: height * 0.18,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(30)),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: height * 0.23,
                    width: width * 0.30,
                    decoration: BoxDecoration(
                        color: Colors.pink.shade200,
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset('Assets/images/fm.png'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${appPro.ordersModel!.data!.orders![index].userName}',
                        style:
                            const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text('${appPro.ordersModel!.data!.orders![index].userEmail}',style: TextStyle(
                        fontSize: size.height*0.015
                      ),),
                      Text('${appPro.ordersModel!.data!.orders![index].userPhone}',style: TextStyle(
                          fontSize: size.height*0.015
                      )),
                      RichText(
                        text:  TextSpan(
                          style: const TextStyle(color: Colors.black, fontSize: 36),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Rs: ',
                                style:
                                    TextStyle(fontSize: size.height*0.02)),
                            TextSpan(text: '${appPro.ordersModel!.data!.orders![index].orderTotal}', style: TextStyle(fontSize: size.height*0.02,color: Colors.pink.shade200))
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: height * 0.02,
        )
      ],
    );
  }
}
