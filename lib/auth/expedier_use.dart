import 'package:expedier/classes/use_cases.dart';
import 'package:expedier/nav/home_main.dart';
import 'package:flutter/material.dart';

import '../classes/app_color.dart';
import '../classes/main_class.dart';
import '../widgets/btn.dart';

class ExpedierUse extends StatefulWidget {
  const ExpedierUse({super.key});

  @override
  State<ExpedierUse> createState() => _State();
}

class _State extends State<ExpedierUse> {

  List<UseCases> ls = [];

  @override
  void initState() {
    getUses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: MainClass.customAppBarWh(),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            MainClass.heading('Expedier Use', context, true),
            Expanded(
              child: Padding(
                padding: MainClass.padA(16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MainClass.txtCus4('What do you want to use \nExpédier For?', 20, AppColor.colorAppGray21),
                      MainClass.bH(12),
                      MainClass.txtCus3('We need to know this for correct regulating your date. And also, we are really interested!', 14, AppColor.colorAppGray42),
                      MainClass.bH(8),
                      MainClass.txtCus3('Everyday Banking', 14, AppColor.colorAppGray42),
                      MainClass.bH(8),
                      Wrap(
                        alignment: WrapAlignment.center,
                        children: List.generate(ls.length, (i){
                          final UseCases u = ls[i];
                          return Container(
                            margin:  MainClass.padS(8, 12),
                            padding: MainClass.padS(12, 24),
                            decoration: MainClass.conDecor(40, AppColor.colorApp, 0.5, u.selected ? AppColor.colorApp : Colors.white),
                            child: InkWell(
                              onTap: (){
                                setState(() {
                                  u.selected = !u.selected;
                                });
                              },
                              child: MainClass.txtCus3(u.name, 13, u.selected ? Colors.white : AppColor.colorAppGray21),
                            ),
                          );
                        })
                      ),
                      MainClass.bH(24),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: MainClass.padS(4, 16),
              child: Btn(
                onPressed: () {
                  int x = 0;
                  for(int i = 0; i < ls.length; i++){
                    if(ls[i].selected == true){
                      x++;
                    }
                  }

                  if(x == 0){
                    MainClass.err(context, 'Please select at least one option');
                    return;
                  }

                  MainClass.open(context, const HomeMain());
                },
                title: 'Get Started',
              ),
            ),
            MainClass.bH(24),
          ],
        ),
      ),
    );
  }

  getUses() {
    UseCases u01 = UseCases('01', '💰 Savings', false);
    UseCases u02 = UseCases('02', '🤑 Cashback', false);
    UseCases u03 = UseCases('03', '🌍 Multiple Transfers', false);
    UseCases u04 = UseCases('04', '📚 Financial Literacy', false);
    UseCases u05 = UseCases('05', '💸 Top up', false);
    UseCases u06 = UseCases('06', '💴 Credits', false);
    UseCases u07 = UseCases('07', '🤝 Investing', false);
    UseCases u08 = UseCases('08', '📈 Track your outcomes', false);
    UseCases u09 = UseCases('09', '🔎 Balance Monitoring', false);
    UseCases u10 = UseCases('10', '🔒 Security', false);
    UseCases u11 = UseCases('11', '🔐 Safety', false);
    UseCases u12 = UseCases('12', '💳 Card Management', false);

    ls.add(u01);
    ls.add(u02);
    ls.add(u03);
    ls.add(u04);
    ls.add(u05);
    ls.add(u06);
    ls.add(u07);
    ls.add(u08);
    ls.add(u09);
    ls.add(u10);
    ls.add(u11);
    ls.add(u12);

  }
}
