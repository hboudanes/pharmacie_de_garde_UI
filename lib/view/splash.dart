import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pharmacie_de_garde_ui/theme/Image_path.dart';
import 'package:pharmacie_de_garde_ui/theme/text_data.dart';
import 'package:pharmacie_de_garde_ui/theme/theme_text_style.dart';

import '/controller/splash_controller.dart';

class Splash extends StatelessWidget {
  Splash({Key? key}) : super(key: key);
  final SpalshController spalshController = Get.put(SpalshController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        //40.h
        child: Column(
          children: [
            SizedBox(height: 78.h),
            Image.asset(
              ImagePath.logo,
              width: 135.h,
              height: 135.h,
            ),
            SizedBox(height: 20.h),
            Text(TextData.appName, style: ThemeTextStyle().splashTitle),
            SizedBox(height: 30.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(TextData.splashSubTitleFr,
                  textAlign: TextAlign.center,
                  style: ThemeTextStyle().splashSubTitle),
            ),
            SizedBox(height: 76.h),
            Image.asset(
              ImagePath.splashImage,
              height: 665.h,
              width: 564.h,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 308.57.w,
                    height: 119.1.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(62.r))),
                    child: Text(TextData.splashTextFr,
                        style: ThemeTextStyle().splashText),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
