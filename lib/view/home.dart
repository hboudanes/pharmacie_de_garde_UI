import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:pharmacie_de_garde_ui/components/city.dart';
import 'package:pharmacie_de_garde_ui/controller/home_controller.dart';

import '/components/custom_drawer.dart';
import '/theme/theme_colors.dart';
import '/theme/theme_text_style.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        key: scaffoldKey,
        drawer: const CustomDrawer(),
        body: SafeArea(
          child: Column(children: [
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => scaffoldKey.currentState!.openDrawer(),
                  child: Icon(
                    Icons.view_headline,
                    size: 50.h,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 14.9.w),
                Container(
                  width: 569.w,
                  height: 84.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 37.w, right: 25.w), //2537
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextFormField(
                            style: ThemeTextStyle().searchBar,
                            decoration: InputDecoration(
                              hintText: 'Trouve le ville',
                              hintStyle: ThemeTextStyle().searchBarHint,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 40.w,
                        ),
                        Icon(
                          Icons.search,
                          color: ThemeColors.primary,
                          size: 38.38.h,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 32.5.h),
            Expanded(
              child: Container(
                padding:
                    EdgeInsets.only(right: 20.2.w, left: 20.2.w, top: 20.2.h),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60.r),
                        topRight: Radius.circular(60.r))),
                child: ListView(
                  children: const [
                    City(
                        name: "Youssoufia",
                        scheduleNight: "24/24",
                        scheduleDay: "",
                        ondutyDate: "Du 27 au 03 Juillet 2022"),
                    SizedBox(height: 10),
                    City(
                        name: "Youssoufia",
                        scheduleNight: "24/24",
                        scheduleDay: "",
                        ondutyDate: "Du 27 au 03 Juillet 2022"),
                    SizedBox(height: 10),
                    City(
                        name: "Youssoufia",
                        scheduleNight: "24/24",
                        scheduleDay: "",
                        ondutyDate: "Du 27 au 03 Juillet 2022"),
                    SizedBox(height: 10),
                    City(
                        name: "Youssoufia",
                        scheduleNight: "24/24",
                        scheduleDay: "",
                        ondutyDate: "Du 27 au 03 Juillet 2022"),
                    SizedBox(height: 10),
                    City(
                        name: "Youssoufia",
                        scheduleNight: "24/24",
                        scheduleDay: "",
                        ondutyDate: "Du 27 au 03 Juillet 2022"),
                    SizedBox(height: 10),
                    City(
                        name: "Youssoufia",
                        scheduleNight: "24/24",
                        scheduleDay: "",
                        ondutyDate: "Du 27 au 03 Juillet 2022"),
                    SizedBox(height: 10),
                    City(
                        name: "Youssoufia",
                        scheduleNight: "24/24",
                        scheduleDay: "",
                        ondutyDate: "Du 27 au 03 Juillet 2022"),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            Obx(() {
              if (homeController.isBottomBannerAdLoaded.value) {
                return Container(
                  height: 100,
                  child: AdWidget(ad: homeController.bottomBannerAd),
                );
              }
              return const SizedBox(height: 1);
            })
          ]),
        ));
  }
}
