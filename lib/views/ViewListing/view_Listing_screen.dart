import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tester_admin_panel/Providers/core_providers.dart';
import 'package:tester_admin_panel/views/DashboardScreen/dashboard_screen.dart';

class ViewListingScreen extends StatelessWidget {
  final List images = [];
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.white,
          elevation: 5,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text('View Listing', style: TextStyle(color: Colors.black),),
          leading: InkWell(
              onTap: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context)=>DashBoardScreen()
                ));
              },
              child: const Icon(Icons.arrow_back)),

        ),
        body: SafeArea(


          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('Available Products:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            ),
              Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: context.read<CoreProviders>().productListingModel!.data!.ads!.length,
                    // itemCount: _myListingController.productList.length,
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 1.0,
                        crossAxisSpacing: 6,
                        mainAxisSpacing: 1),
                    itemBuilder: (context, index) =>
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: PhysicalModel(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            elevation: 5,
                            shadowColor: Colors.black,
                            child: SizedBox(
                              height: 50,
                              width: 50,
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: size.height*0.12,
                                        margin: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage('${context.read<CoreProviders>().productListingModel!.data!.ads![index].adImage}')
                                            )
                                        ),
                                      )],
                                  ),
                                  Text('${context.read<CoreProviders>().productListingModel!.data!.ads![index].adName}',style: TextStyle(
                                    fontSize:size.height*0.015
                                  ),),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Rs. ${context.read<CoreProviders>().productListingModel!.data!.ads![index].adPrice}', style: const TextStyle(color: Colors.pink),),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                  )
              )
              ,
            ],
          ),
        ));
  }
}
