import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tester_admin_panel/controller/homescreen_controller.dart';
import 'package:tester_admin_panel/controller/login_controller.dart';
import 'package:tester_admin_panel/Providers/core_providers.dart';
import 'package:tester_admin_panel/views/DeliveryAreaScreen/delovery_area_screen.dart';
import 'package:tester_admin_panel/views/OrderScreen/order_screen.dart';
import 'package:tester_admin_panel/views/ProfileScreen/ProfileScreen.dart';
import 'package:tester_admin_panel/views/ViewListing/view_Listing_screen.dart';
import 'package:tester_admin_panel/widget/homeicon/home_text.dart';
import 'package:tester_admin_panel/widget/homeicon/whomebutton.dart';
import 'package:tester_admin_panel/widget/menu_widget.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatelessWidget {
  final LoginController _loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Consumer<CoreProviders>(builder: (context,appPro,_){
      return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.blue,
            title: const Text('Home'),
            leading: MenuWidget(),
            actions: [
              Center(
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        children: const [],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          height: Get.height*0.22,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration: const Duration(milliseconds: 800),
                          viewportFraction: 0.8,
                        ),
                        items: [
                          for(int i =0 ; i<context.read<CoreProviders>().bannerModel!.data!.banners!.length;i++)

                            ClipRRect(borderRadius: BorderRadius.circular(20),
                                child: CachedNetworkImage(imageUrl: '${context.read<CoreProviders>().bannerModel!.data!.banners![i].image}',fit: BoxFit.cover,)),

                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          WhomeIconButton(inOnPressed: () async{
                            appPro.getListLoader();
                            BannerRepo().getOrders(context).then((value){
                              appPro.getListLoader();
                              Get.to(OrderScreen());
                            });
                          },
                            imgName: 'Assets/images/shopping-cart.png',
                            colors1: Colors.green.withOpacity(0.4),
                          ),
                          WhomeIconButton(inOnPressed: () {
                            Get.to(ProfileScreen());
                          },
                              imgName: 'Assets/images/man.png',
                              colors1: const Color(0xff133BBE).withOpacity(0.4))
                        ],
                      ),
                      SizedBox(
                        height: size.height * .03,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              HomeText(
                                nText: 'ORDERS',
                              ),
                              HomeText(nText: 'PROFILE')
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height * .03,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              WhomeIconButton(inOnPressed: () {
                                Get.to(const DeliveryAreaScreen());
                              },
                                  imgName: 'Assets/images/location.png',
                                  colors1: Colors.yellow.withOpacity(0.4)),
                              WhomeIconButton(inOnPressed: () async{
                                appPro.getListLoader();
                                BannerRepo().getProductListing(context).then((value){
                                  appPro.getListLoader();
                                  Get.to(ViewListingScreen());
                                });

                                // Get.to(ViewListingScreen());
                              },
                                  imgName: 'Assets/images/package.png',
                                  colors1: const Color(0xffB90E0A).withOpacity(0.4))
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height * .03,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              HomeText(nText: 'LOCATION'),
                              HomeText(nText: 'LISTING')
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              appPro.listLoader?const Center(
                child: CircularProgressIndicator(color: Colors.black,),
              ):const SizedBox(),
            ],
          ),
      );
    });
  }
}
