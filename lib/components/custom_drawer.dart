import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmacie_de_garde_ui/components/drawer_button.dart';

import '/theme/Image_path.dart';
import '/theme/text_data.dart';
import '/theme/theme_colors.dart';
import '/theme/theme_text_style.dart';
import 'drawer_button_share.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(35.r),
                bottomRight: Radius.circular(35.r)),
            child: Drawer(
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 63.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 46.w),
                      child: Image.asset(
                        ImagePath.logo,
                        height: 123.h,
                        width: 123.h,
                      ),
                    ),
                    SizedBox(
                      height: 184.5.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 46.w),
                      child: Text(TextData.appName,
                          style: ThemeTextStyle().drawerTitle),
                    ),
                    SizedBox(
                      height: 41.7.h,
                    ),
                    DrawerButton(
                      onTap: () {},
                      star: true,
                      title: TextData.rate,
                      prefixIcon:const Icon(
                        Icons.rate_review,
                        // size: 32.h,
                        color: ThemeColors.primary,
                      ),
                    ),
                    DrawerButton(
                      onTap: () {},
                      title: TextData.private,
                      prefixIcon:const Icon(
                        Icons.policy,
                        color: ThemeColors.primary,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    DrawerButton(
                      onTap: () {},
                      title: TextData.inFacebook,
                      prefixIcon: SvgPicture.asset(
                        ImagePath.facebookSvg,
                        color: ThemeColors.primary,
                        
                      ),
                    ),
                    SizedBox(height: 44.4.h,),
                    Padding(
                      padding: EdgeInsets.only(left: 46.w),
                      child: Text(TextData.share,
                          style: ThemeTextStyle().drawerTitle),
                    ),
                    SizedBox(height: 44.4.h,),
                    DrawerButtonShare(
                      onTap: () {},
                      title: 'FaceBook',
                      imagePath:ImagePath.facebook ,
                    ),
                    DrawerButtonShare(
                      onTap: () {},
                      title: 'WhatsApp',
                      imagePath:ImagePath.whatsapp ,
                    ),
                  ],
                ),
              ),
            ));
  }
}