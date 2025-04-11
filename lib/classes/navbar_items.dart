import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'app_color.dart';
import 'main_class.dart';

class NavbarItems extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;

  const NavbarItems({super.key, required this.pageIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      padding: EdgeInsets.zero,
      child: Container(
        color: Colors.white,
        child: Row(
          children: [
            navItem('assets/nav/1.svg', 'Home', 0, () => onTap(0)),
            navItem('assets/nav/2.svg', 'Cards', 1, () => onTap(1)),
            const Spacer(),
            navItem('assets/nav/3.svg', 'Referral', 2, () => onTap(2)),
            navItem('assets/nav/4.svg', 'Profile', 3, () => onTap(3)),

          ],
        ),
      ),
    );
  }

  navItem(ic, name, sel, onTap){
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              ic,
              colorFilter: MainClass.col(pageIndex == sel ? AppColor.colorApp : AppColor.colorAppLight4),
            ),
            MainClass.bH(2),
            MainClass.txtCus4(name, 12, pageIndex == sel ? AppColor.colorAppDark : AppColor.colorAppLight4)
          ],
        ),
      ),
    );
  }

}
