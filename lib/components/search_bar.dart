import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/theme/theme_colors.dart';
import '/theme/theme_text_style.dart';

class SearchBar extends StatelessWidget {
  final String title;
  final void Function(String)? onChanged;
  final void Function(String)? onTap;
  const SearchBar({Key? key, required this.title, this.onChanged, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Container(
      width: 569.w,
      height: 84.h,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: EdgeInsets.only(left: 37.w, right: 25.w), //2537
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                onChanged: onChanged,
                style: ThemeTextStyle().searchBar,
                decoration: InputDecoration(
                  hintText: title,
                  hintStyle: ThemeTextStyle().searchBarHint,
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              width: 40.w,
            ),
            InkWell(
              onTap: () {
                onTap!(controller.text);//retune data from testfield 
              },
              child: Icon(
                Icons.search,
                color: ThemeColors.primary,
                size: 38.38.h,
              ),
            )
          ],
        ),
      ),
    );
  }
}
