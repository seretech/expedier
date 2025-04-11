import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../classes/app_color.dart';
import '../classes/dotted_circle.dart';
import '../classes/main_class.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _State();
}

class _State extends State<Home> {

  bool amt = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainClass.customAppBarWh(),
      backgroundColor: AppColor.colorAppBg,
      body: Padding(
        padding: MainClass.padA(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  child: Image.asset('assets/faces/face1.png', width: 48, height: 48),
                ),
                MainClass.bW(4),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MainClass.txtCus4('Hello, Kingsley', 20, AppColor.colorAppGray21),
                      MainClass.txtCus3('Ready to manage your \nfinances today? 💰', 14, AppColor.colorAppGray42),
                    ],
                  ),
                ),
                MainClass.bW(12),
                Image.asset('assets/extras/noti.png', width: 24, height: 24),
              ],
            ),
            MainClass.bH(12),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset('assets/extras/home_card.png'),
                        Padding(
                          padding: MainClass.padS(8, 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Image.asset('assets/extras/logo.png', width: 20, height: 20),
                                  MainClass.bW(4),
                                  Image.asset('assets/extras/app_name.png', width: MainClass.devW(context, 4), height: MainClass.devW(context, 12)),
                                  MainClass.bW(4),
                                  Expanded(child: Align(alignment: Alignment.topRight,child: MainClass.txtW4('Personal Tag: John123', 12)))
                                ],
                              ),
                              MainClass.bH(4),
                              MainClass.txtW4('Card Balance', 14),
                              MainClass.bH(8),
                              Row(
                                children: [
                                  if(amt)
                                    Expanded(child: MainClass.txtW5('₦ 1,500,255', 28)),
                                  if(!amt)
                                    Expanded(child: MainClass.txtW5('₦ *****', 28)),
                                  MainClass.bW(12),
                                  InkWell(
                                      onTap: (){
                                        setState(() {
                                          amt = !amt;
                                        });
                                      },
                                      child: Icon(amt ? Icons.visibility_off_outlined : Icons.visibility_outlined, color: Colors.white)
                                  ),
                                ],
                              ),
                              MainClass.bH(8),
                              MainClass.txtW4('2984 5633 7859 4141', 12),
                              MainClass.txtW4('John Kingsley', 14),
                              MainClass.bH(16),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 16,
                          right: 4,
                          child: Padding(
                            padding: MainClass.padS(12, 12),
                            child: SvgPicture.asset('assets/extras/add.svg', width: 24, height: 24, colorFilter: MainClass.col('wh')),
                          ),
                        )
                      ],
                    ),
                    MainClass.bH(12),
                    Row(
                      children: [
                        Expanded(child: MainClass.txtCus4('Quick Send', 14, AppColor.colorAppGray21)),
                        MainClass.bW(12),
                        Container(
                          padding: MainClass.padA(12),
                          decoration: BoxDecoration(shape: BoxShape.circle, color: AppColor.colorApp.withValues(alpha: 0.08)),
                          child: SvgPicture.asset('assets/extras/ar_down.svg'),
                        ),
                      ],
                    ),
                    MainClass.bH(8),
                    SizedBox(
                      height: MainClass.devW(context, 4),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          MainClass.bW(2),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              MainClass.bH(2),
                              CustomPaint(
                                painter: DottedCircle(
                                  strokeWidth: 4,
                                  color: AppColor.colorAppLight,
                                  dashWidth: 6,
                                  dashSpace: 4,
                                ),
                                child: Container(
                                  width: MainClass.devW(context, 6),
                                  height: MainClass.devW(context, 6),
                                  padding: MainClass.padA(20),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: SvgPicture.asset('assets/extras/add.svg', width: 16, height: 16, colorFilter: MainClass.col(AppColor.colorApp.withValues(alpha: 0.5))),
                                ),
                              ),
                              MainClass.bH(8),
                              MainClass.txtCus4('Add', 14, AppColor.colorAppLight),
                            ],
                          ),
                          MainClass.bW(12),
                          MainClass.quickCard('Daniel D.', 'assets/faces/face2.png', context),
                          MainClass.bW(12),
                          MainClass.quickCard('Becky J.', 'assets/faces/face3.png', context),
                          MainClass.bW(12),
                          MainClass.quickCard('Harper H.', 'assets/faces/face4.png', context),
                          MainClass.bW(12),
                          MainClass.quickCard('Kingsley J.', 'assets/faces/face1.png', context),
                          MainClass.bW(12),
                          MainClass.quickCard('Olivia Q.', 'assets/faces/face5.png', context),
                        ],
                      ),
                    ),
                    MainClass.bH(12),
                    Row(
                      children: [
                        Expanded(child: MainClass.txtCus4('Accounts', 14, AppColor.colorAppGray21)),
                        MainClass.bW(12),
                        Container(
                          padding: MainClass.padA(12),
                          decoration: BoxDecoration(shape: BoxShape.circle, color: AppColor.colorApp.withValues(alpha: 0.08)),
                          child: SvgPicture.asset('assets/extras/ar_down.svg'),
                        ),
                      ],
                    ),
                    MainClass.bH(8),
                    SizedBox(
                      height: MainClass.devH(context, 6),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          MainClass.accountCard('₦ 1,200,457', 'Nigerian Naira', 'assets/extras/ng.png', context),
                          MainClass.bW(12),
                          MainClass.accountCard('C\$ 1,500', 'Canadian Dollars', 'assets/extras/ca.png', context),
                          MainClass.bW(12),
                          MainClass.accountCard('\$ 2,250.37 ', 'United States Dollars', 'assets/extras/us.png', context),
                        ],
                      ),
                    ),
                    MainClass.bH(24),
                    Row(
                      children: [
                        Expanded(child: MainClass.txtCus4('Recent Transactions', 14, AppColor.colorAppGray21)),
                        MainClass.bW(12),
                        Container(
                          padding: MainClass.padA(12),
                          decoration: BoxDecoration(shape: BoxShape.circle, color: AppColor.colorApp.withValues(alpha: 0.08)),
                          child: SvgPicture.asset('assets/extras/ar_down.svg'),
                        ),
                      ],
                    ),
                    MainClass.bH(8),
                    Container(
                      padding: MainClass.padS(4, 12),
                      decoration: MainClass.conDeco(15, Colors.white),
                      child: Row(
                        children: [
                          Container(
                            padding: MainClass.padA(12),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.colorAppLight2,
                            ),
                            child: Image.asset('assets/extras/rent.png', width: 24, height: 24),
                          ),
                          MainClass.bW(8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                MainClass.txtB4('House Rent', 14),
                                MainClass.bH(2),
                                Row(
                                  children: [
                                    Expanded(child: MainClass.txtCus3('House Rent', 12, AppColor.colorAppGray42.withValues(alpha: 0.7))),
                                    MainClass.bW(12),
                                    MainClass.txtCus3('Today, 01:43PM', 12, AppColor.colorAppGray42.withValues(alpha: 0.7))
                                  ],
                                )
                              ],
                            ),
                          ),
                          MainClass.bW(12),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}
