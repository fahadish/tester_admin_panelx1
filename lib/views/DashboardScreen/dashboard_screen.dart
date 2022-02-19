import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:tester_admin_panel/views/DashboardScreen/zoomdrower/dashboard_menu.dart';
import 'package:tester_admin_panel/views/DeliveryAreaScreen/delovery_area_screen.dart';
import 'package:tester_admin_panel/views/HomeScreen/home_screen.dart';
import 'package:tester_admin_panel/views/LoginScreens/login_screen.dart';
import 'package:tester_admin_panel/views/OrderScreen/order_screen.dart';
import 'package:tester_admin_panel/views/ProfileScreen/ProfileScreen.dart';
import 'package:tester_admin_panel/views/ViewListing/view_Listing_screen.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  MenuItem currentItem = MenuItems.home;

  @override
  Widget build(BuildContext context) => ZoomDrawer(
        mainScreen: getScreen(),
        menuScreen: Builder(
          builder: (context) => MenuDashboard(
              currentItem: currentItem,
              onSelected: (item) {
                setState(() => currentItem = item);
                ZoomDrawer.of(context)!.close();
              }),
        ),
        style: DrawerStyle.Style1,
    borderRadius: 40,
    angle: -10,
    slideWidth: MediaQuery.of(context).size.width*0.7,
    showShadow: true,backgroundColor: Colors.orangeAccent ,
      );

  getScreen() {
    switch (currentItem) {
      case MenuItems.home:
        return HomeScreen();
      case MenuItems.profile:
        return ProfileScreen();
      case MenuItems.deliveryArea:
        return const DeliveryAreaScreen();
      case MenuItems.viewListing:
        return ViewListingScreen();
      case MenuItems.orders:
        return OrderScreen();
      case MenuItems.logout:
        return LoginScreen();

    }
  }
}
