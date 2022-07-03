import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/theme_text_style.dart';

class DrawerButton extends StatelessWidget {
  final Function()? onTap;
  final bool star; //if true show Row of star // def = false
  final String? title;
  final Widget? prefixIcon;
  const DrawerButton({
    Key? key,
    this.onTap,
    this.star = false,
    this.title,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(left: 56.w),
        height: 99.h,
        decoration: BoxDecoration(
           color: Colors.white,
            border: Border(
                bottom: BorderSide.none,
                top: BorderSide(
          width: 1.h,
          color: const Color(0xFF707070).withOpacity(0.10),
        ))),
        width: double.infinity,
        child: Row(children: [
          Container(
            width: 32.h,
            height: 32.h,
            child:prefixIcon!,
          ),
          SizedBox(
            width: 64.w,
          ),
          Text(title!, style: ThemeTextStyle().drawerButton),
          SizedBox(
            width: 8.2.w,
          ),
          star == true
              ? Row(
                //return list 5 icon 
                  children: List.generate(
                      5,
                      (index) => Icon(
                            Icons.star,
                            size: 24.h,
                            color: const Color(0xFF01875F),
                          )).toList(),
                )
              : const SizedBox(
                  width: 0,
                )
        ]),
      ),
    );
  }
}
