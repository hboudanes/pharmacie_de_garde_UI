import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacie_de_garde_ui/theme/theme_colors.dart';

class ThemeTextStyle {
  //splash
  final TextStyle splashTitle =
      TextStyle(color: Colors.white, fontSize: 54.sp, fontFamily: 'UbuntuBlod');
  final TextStyle splashSubTitle =
      TextStyle(color: Colors.white, fontSize: 35.sp, fontFamily: 'Ubuntu');
  final TextStyle splashText = TextStyle(
      color: ThemeColors.primary, fontSize: 25.sp, fontFamily: 'Ubuntu');

  //home page
  //searchbar
  final TextStyle searchBar = TextStyle(
      color: ThemeColors.primary, fontSize: 30.sp, fontFamily: 'Ubuntu');
  final TextStyle searchBarHint = TextStyle(
      color: ThemeColors.inputHint, fontSize: 30.sp, fontFamily: 'Ubuntu');
  //Drawer
  final TextStyle drawerTitle = TextStyle(
      color: ThemeColors.drawerTitle,
      fontSize: 29.sp,
      fontFamily: 'UbuntuBlod');
  final TextStyle drawerButton = TextStyle(
      color: ThemeColors.drawerTitle, fontSize: 29.sp, fontFamily: 'Ubuntu');
  //panelcity
  final TextStyle panalTitle = TextStyle(
      color: ThemeColors.primary, fontSize: 30.sp, fontFamily: 'Ubuntu');
  final TextStyle panalSubTitleMedium = TextStyle(
      color: ThemeColors.primary, fontSize: 21.sp, fontFamily: 'UbuntuMedium');
  final TextStyle panalSubTitle = TextStyle(
      color: ThemeColors.primary, fontSize: 21.sp, fontFamily: 'Ubuntu');
  final TextStyle panaltext = TextStyle(
      color: Colors.black, fontSize: 20.sp, fontFamily: 'Ubuntublod');
  
}
