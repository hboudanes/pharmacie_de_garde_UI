// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pharmacie_de_garde_ui/components/custom_drawer.dart';
import 'package:pharmacie_de_garde_ui/theme/theme_colors.dart';

import '../components/search_bar.dart';
import '/components/navigationbar/icon_Btn.dart';

class Pharmacie extends StatelessWidget {
  const Pharmacie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      bottomNavigationBar: NavigationBottomBar(onTap: (int? i) {
        //i=0 day and i= 1 nuit
        print(i);
      }),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: Column(children: [
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 130.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => scaffoldKey.currentState!.openDrawer(),
                        child: Icon(
                          Icons.view_headline,
                          size: 50.h,
                          color: Colors.white,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 30.h,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 360.w,
                  child: Column(
                    children: [
                      Text(
                        'Pharmacies De Garde Casablanca',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'UbuntuBlod',
                            fontSize: 35.sp),
                      ),
                      SizedBox(
                        height: 15.9.h,
                      ),
                      Text(
                        'Du 02 au 08 Juillet 2022',
                        style: TextStyle(
                            color: Color(0xFFFFBF67),
                            fontFamily: 'UbuntuBlod',
                            fontSize: 25.sp),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: Container(
              padding:
                  EdgeInsets.only(right: 20.2.w, left: 20.2.w, top: 20.2.h),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60.r),
                      topRight: Radius.circular(60.r))),
            ),
          ),
        ]),
      ),
    );
  }
}
