import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/theme_text_style.dart';

class DrawerButtonShare extends StatelessWidget {
  final Function()? onTap;
  final String? title;
  final String? imagePath;
  const DrawerButtonShare({
    Key? key,
    this.onTap,
    this.imagePath,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(left: 62.7.w),
        height: 90.h,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(
                  width: 1.h,
                  color: const Color(0xFF707070).withOpacity(0.10),
                ),
                top: BorderSide.none)),
        width: double.infinity,
        child: Row(children: [
          Image.asset(
            imagePath!,
            width: 30,
            height: 30,
          ),
          SizedBox(
            width: 35.5.w,
          ),
          Text(title!, style: ThemeTextStyle().drawerButton),
        ]),
      ),
    );
  }
}
