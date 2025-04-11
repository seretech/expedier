import 'package:expedier/classes/navbar.dart';
import 'package:expedier/classes/navbar_items.dart';
import 'package:expedier/nav/cards.dart';
import 'package:expedier/nav/home.dart';
import 'package:expedier/nav/profile.dart';
import 'package:expedier/nav/referral.dart';
import 'package:flutter/material.dart';
import 'package:move_to_background/move_to_background.dart';

import '../classes/app_color.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({super.key});

  @override
  State<HomeMain> createState() => _State();
}

class _State extends State<HomeMain> {

  final homeNav = GlobalKey<NavigatorState> ();
  final cardNav = GlobalKey<NavigatorState> ();
  final referralNav = GlobalKey<NavigatorState> ();
  final profileNav = GlobalKey<NavigatorState> ();

  int selectedIndex = 0;

  List <NavBar> pages = [];

  @override
  void initState() {
    pages = [
      NavBar(
          page: const Home(),
          navKey: homeNav
      ),
      NavBar(
          page: const Cards(),
          navKey: cardNav
      ),
      NavBar(
          page: const Referral(),
          navKey: referralNav
      ),
      NavBar(
          page: const Profile(),
          navKey: profileNav
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (b, v) {
        if(!b){
          MoveToBackground.moveTaskToBack();
          return;
        }
      },
      child: Scaffold(
        body: IndexedStack(
          index: selectedIndex,
          children: pages.map((e) => e.page).toList(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          backgroundColor: AppColor.colorApp,
          child: Image.asset('assets/nav/main.png', width: 16, height: 16),
        ),
        bottomNavigationBar: NavbarItems(
            pageIndex: selectedIndex,
            onTap: (i){
              if(i == selectedIndex){
                pages[i].navKey.currentState!.popUntil((route) => route.isFirst);
              }else{
                setState(() {
                  selectedIndex = i;
                });
              }
            }
        ),
      ),
    );
  }

}
