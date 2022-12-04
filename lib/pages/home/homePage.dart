import 'package:cakeland/pages/basket/basket.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../settingPage/setting.dart';
import '../widget/cake.dart';
import '../widget/cakeType.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String id = 'home_page';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final user = FirebaseAuth.instance.currentUser!;

  int _navIndex = 0;
  Future navBottom(int index)async{
    if(index == 0) {
      Navigator.pushReplacementNamed(context, HomePage.id);
    } else if(index == 1) {
      Navigator.pushReplacementNamed(context, SettingPage.id);
    }else if(index == 2){
      Navigator.pushReplacementNamed(context, BasketPage.id);
    }
    setState(() {
      _navIndex = index;
    });
  }


  final List cakeType = [
    ['Popular',true],
    ['Pie',false],
    ['Donut',false],
    ['Cookie',false],
    ['Fruitly',false],
    ['Sweet',false]
  ];


  void cakeSelected(int index){
    setState(() {
      for(int i=0; i<cakeType.length; i++){
        cakeType[i][1] = false;
      }
      cakeType[index][1] = true;

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        //leading: Icon(Icons.menu_rounded,color: Colors.red[300],),
        actions: [
          Padding(padding: const EdgeInsets.all(15.0),
              child: ClipOval(child: Image.asset('assets/images/cake_logo.png')))
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        //currentIndex: _navIndex,
        onTap: navBottom,
        backgroundColor: Colors.red.shade50,
        color: Colors.red.shade200,
        animationDuration: const Duration(milliseconds: 300),
        items: [
          Icon(Icons.home_filled,color: _navIndex == 0 ? Colors.redAccent[400] : Colors.red[50],),
          Icon(Icons.settings,color:  _navIndex == 1 ? Colors.redAccent[400] : Colors.red[50],),
          Icon(Icons.shopping_bag,color:  _navIndex == 2 ? Colors.redAccent[400] : Colors.red[50],),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text('Choose your cake...',
              style: GoogleFonts.satisfy(fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[900]),

            ),
            const SizedBox(height: 30,),
            SizedBox(
                height: 50,
                child: ListView.builder(itemCount: cakeType.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      return CakeType(
                          onTap: (){cakeSelected(index);} ,
                          selected: cakeType[index][1],
                          caketype: cakeType[index][0]);
                    })
            ),

            Expanded(child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                Cake_tile(cakeImage: 'assets/images/pieNew.jpg',
                  cakeContent: 'With Sweet Berry',
                  cakeName: 'Pie',cakePrice: '12.0',),
                Cake_tile(cakeImage: 'assets/images/donutNew.jpg',
                  cakeContent: 'With Chocolate',
                  cakeName: 'Donut',cakePrice: '8.5',),
                Cake_tile(cakeImage: 'assets/images/cookieNew.jpg',
                  cakeContent: 'With Different Colors',
                  cakeName: 'Cookie',cakePrice: '5.7',),
                Cake_tile(cakeImage: 'assets/images/fruity.jpg',
                  cakeContent: 'With StraweBerry',
                  cakeName: 'Fruitly',cakePrice: '18.3',),
                Cake_tile(cakeImage: 'assets/images/sweet.jpg',
                  cakeContent: 'With Dark Chocolate',
                  cakeName: 'Sweet',cakePrice: '17.0',),
              ],
            )),
            Text('The best offers for you!',style:
              GoogleFonts.satisfy(color: Colors.red.shade900,
              fontWeight: FontWeight.bold,fontSize: 25,wordSpacing: 5),),
            const SizedBox(height: 15,),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.red[50],
        child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName:  Text('User of CakeLand',
                style: GoogleFonts.ubuntu(fontSize: 20),),
                accountEmail: Text(user.email!,style: GoogleFonts.ubuntu(),),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child: Image.asset('assets/images/cake_logo.png',
                      fit: BoxFit.cover,),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.red.shade200
                ),
              ),
              Center(
                child: Text('Cake Land',style: GoogleFonts.kolkerBrush(
                    fontSize: 55,fontWeight: FontWeight.bold,
                    color: Colors.red[700]
                ),),
              ),

              ListTile(
                leading: const Icon(Icons.home_filled,color: Colors.red,),
                title: const Text('HOME'),
                textColor: Colors.red,
                onTap: (){
                  Navigator.pushReplacementNamed(context, HomePage.id);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings,color: Colors.red,),
                title: const Text('SETTINGS'),
                textColor: Colors.red,
                onTap: (){
                  Navigator.pushReplacementNamed(context, SettingPage.id);
                },
              ),
              ListTile(
                leading: const Icon(Icons.shopping_bag,color: Colors.red,),
                title: const Text('BASKET'),
                textColor: Colors.red,
                onTap: (){
                  Navigator.pushReplacementNamed(context, BasketPage.id);
                },
              ),
              ListTile(
                leading: const Icon(Icons.output_outlined,color: Colors.red,),
                title: const Text('LOGOUT'),
                textColor: Colors.red,
                onTap: (){
                  FirebaseAuth.instance.signOut();
                },
              )
            ]
        ),
      ),
    );
  }
}
