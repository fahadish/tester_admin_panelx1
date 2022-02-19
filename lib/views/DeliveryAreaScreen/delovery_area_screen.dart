import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tester_admin_panel/controller/profile%20controller.dart';
import 'package:tester_admin_panel/views/DashboardScreen/dashboard_screen.dart';
import 'package:tester_admin_panel/widget/WsignUpButton/w_signup_button.dart';
import 'package:tester_admin_panel/widget/menu_widget.dart';

class DeliveryAreaScreen extends StatelessWidget {
  const DeliveryAreaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(   iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Area',
          style: TextStyle(color: Colors.black),
        ),
        leading: InkWell(
            onTap: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context)=>DashBoardScreen()
              ));
            },
            child: const Icon(Icons.arrow_back)),

        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.03, horizontal: size.width * 0.05),
              child:
                  SignUpButton(inputText: 'ADD AREA\'S +', inOnPressed: () {Get.bottomSheet(addAreaBottomSheetContainer());})),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.09),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Name'),
                Text('Status'),
                Text('Sort Order'),
                Text('Edit/Delete'),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: PhysicalModel(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              elevation: 6,
              shadowColor: Colors.black,
              child: Container(
                margin: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      // color: Colors.pink,
                      width: size.width*0.2,
                        child: const Text(
                      'Green City,Lahore',
                      maxLines: 3,
                    )),

                     const Text('yes'),
SizedBox(width: size.width*0.05,),
                     const Text('1'),

                    Container(

                      child: Row(

                        children: [

                          IconButton(
                              onPressed: () {
                                Get.bottomSheet(editAreaBottomSheetContainer());

                              }, icon: const Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.delete_forever_outlined)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

 editAreaBottomSheetContainer(){
   final  ProfileController _profileController = Get.put(ProfileController());
    var Mycontroller;
    return Container(decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30)),
      child: Column(children: [
        const SizedBox(height: 10,),
        const Text('Add Area',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
      Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: PhysicalModel(
        color: Colors.white,
        shadowColor: Colors.black,
        elevation: 5,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: TextFormField(
              decoration: const InputDecoration(
                fillColor: Colors.white,
                border: InputBorder.none,
                labelText: 'Name',
              ),
              keyboardType: TextInputType.emailAddress,
              controller: Mycontroller,
              onSaved: (value) {
                _profileController.name = value!;
              },),
        ),
      ),
    ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          child: PhysicalModel(
            color: Colors.white,
            shadowColor: Colors.black,
            elevation: 5,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: TextFormField(
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  labelText: 'Sort Order',
                ),
                keyboardType: TextInputType.number,
                controller: Mycontroller,
                onSaved: (value) {
                  _profileController.name = value!;
                },),

            ),
          ),
        ),
        SignUpButton(inputText: 'Save', inOnPressed: (){})
      ],),

    );

 }

  addAreaBottomSheetContainer(){
    final  ProfileController _profileController = Get.put(ProfileController());
    var Mycontroller;
    return Container(decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30)),
      child: Column(children: [
        const SizedBox(height: 10,),
        const Text('Add Area',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          child: PhysicalModel(
            color: Colors.white,
            shadowColor: Colors.black,
            elevation: 5,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: TextFormField(
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  labelText: 'Name',
                ),
                keyboardType: TextInputType.emailAddress,
                controller: Mycontroller,
                onSaved: (value) {
                  _profileController.name = value!;
                },),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          child: PhysicalModel(
            color: Colors.white,
            shadowColor: Colors.black,
            elevation: 5,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: TextFormField(
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  labelText: 'Sort Order',
                ),
                keyboardType: TextInputType.number,
                controller: Mycontroller,
                onSaved: (value) {
                  _profileController.name = value!;
                },),

            ),
          ),
        ),
        SignUpButton(inputText: 'Save', inOnPressed: (){})
      ],),

    );

  }


}
