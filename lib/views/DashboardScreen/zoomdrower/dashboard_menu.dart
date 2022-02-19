import 'package:flutter/material.dart';
class MenuItem{
  final String title;
  final  IconData icon;
  const MenuItem(this.title,this.icon);
}

class MenuItems{
  static const home = MenuItem('Home',Icons.home);
  static const profile = MenuItem('Profile',Icons.face);
  static const deliveryArea = MenuItem('DeliveryArea',Icons.delivery_dining);
  static const viewListing = MenuItem('ViewListing',Icons.featured_play_list_outlined);
  static const orders = MenuItem('Orders',Icons.add_shopping_cart_rounded);
  static const logout = MenuItem('LogOut',Icons.logout_rounded);

  static const all = <MenuItem>[
    home,
    profile,
    deliveryArea,
    viewListing,
    orders,
    logout

  ];
}



class MenuDashboard extends StatelessWidget {
final MenuItem currentItem;
final ValueChanged<MenuItem> onSelected;

  const MenuDashboard({Key? key, required this.currentItem, required this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: Colors.pink,
      body: SafeArea(child: Column(children:<Widget> [
        const Spacer(),
         ...MenuItems.all.map(buildMenuItem).toList(),
        const Spacer(flex: 2,),


      ],),),
      ),
    );



  }

 Widget buildMenuItem(MenuItem item) => ListTileTheme(selectedColor: Colors.white,
   child: ListTile(
     selectedTileColor: Colors.black26,
     selected: currentItem ==item,
      minLeadingWidth: 20,
      leading: Icon(item.icon),
      title: Text(item.title),
      onTap: ()=> onSelected(item) ,
    ),
 );
}
