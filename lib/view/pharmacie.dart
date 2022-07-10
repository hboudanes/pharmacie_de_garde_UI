// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:pharmacie_de_garde_ui/components/custom_drawer.dart';
import 'package:pharmacie_de_garde_ui/controller/pharmacy_controller.dart';

import '/controller/admob_controller.dart';
import '/components/panel_pharmacy.dart';
import '/components/navigationbar/navigation_bottom_bar.dart';

class Pharmacie extends StatelessWidget {
  Pharmacie({Key? key}) : super(key: key);
  final PharmacyController pharmacyController = Get.put(PharmacyController());
  final AdmobController admobController = Get.put(AdmobController());
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      bottomNavigationBar: NavigationBottomBar(onTap: (int? i) {
        pharmacyController.changeMode(i!);
      }),
      drawer: CustomDrawer(),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Column(children: [
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 130.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => scaffoldKey.currentState!
                            .openDrawer(), //open drawer button
                        child: Icon(
                          Icons.view_headline,
                          size: 50.h,
                          color: Colors.white,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
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
                child: GetBuilder<PharmacyController>(
                    init: PharmacyController(),
                    builder: (contoller) {
                      return ListView.builder(
                        itemCount: contoller.pharmacies.length,
                        itemBuilder: (BuildContext context, index) {
                          return Column(
                            children: [
                              PanelPharmacy(
                                name: contoller.pharmacies
                                    .elementAt(index)["name"],
                                address: contoller.pharmacies
                                    .elementAt(index)["address"],
                                neighborhood: contoller.pharmacies
                                    .elementAt(index)["neighborhood"],
                                coordinates: contoller.pharmacies
                                    .elementAt(index)["coordinates"],
                                phone: contoller.pharmacies
                                    .elementAt(index)["telephone"],
                                mode: pharmacyController.mode,
                                onPressed: () {
                                  admobController.showInterstitialAd();
                                },
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                            ],
                          );
                        },
                      );
                    })),
          ),
          Obx(() {
            if (admobController.isBannerPharmacieAdLoade.value) {
              return Container(
                color: Colors.white,
                height:
                    admobController.bannerPharmacieAd.size.height.toDouble(),
                child: AdWidget(ad: admobController.bannerPharmacieAd),
              );
            }
            return const SizedBox(height: 0);
          })
        ]),
      ),
    );
  }
}
