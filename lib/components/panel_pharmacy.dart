import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacie_de_garde_ui/theme/text_data.dart';

import '/theme/theme_colors.dart';

class PanelPharmacy extends StatefulWidget {
  final String? name;
  final String? address;
  final String? neighborhood;
  final String? coordinates;
  final String? phone;
  final void Function()? onTap;
  final bool mode; //change color theme between night and day
  const PanelPharmacy(
      {Key? key,
      this.name = 'Pharmacie Almajad',
      this.address = '17 Rue almarsoki qu jnane colone 2 Safi',
      this.neighborhood = "Jnane Colone 2",
      this.coordinates = "33.606559011114136, -7.487140892284434",
      this.phone = "0614145370",
      this.onTap,
      this.mode = true})
      : super(key: key);

  @override
  State<PanelPharmacy> createState() => _PanelPharmacyState();
}

class _PanelPharmacyState extends State<PanelPharmacy> {
  bool isExpanded = false;
  double height = 115.h;
  double counter = 0;
  late Color iconColor; //black and white
  late Color panelColor; //panel background and and Text Button Color
  late Color panelTextColor; //panel Text and and background Button Color
  late IconData icon;
  @override
  void initState() {
    if (widget.mode) {
      setState(() {
        iconColor = Colors.white;
        panelColor = ThemeColors.panelPharmacyColor;
        panelTextColor = ThemeColors.panelPharmacyTextColor;
        icon = Icons.nights_stay;
      });
    } else {
      setState(() {
        iconColor = Colors.black87;
        panelColor = ThemeColors.panelPharmacyTextColor;
        panelTextColor = ThemeColors.panelPharmacyColor;
        icon = Icons.light_mode;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      onEnd: () {
        setState(() {
          if (height > 90) {
            isExpanded = true;
            return;
          }
        });
      },
      duration: const Duration(milliseconds: 200),
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
          color: panelColor,
          borderRadius: BorderRadius.circular(54.r),
          boxShadow: [
            BoxShadow(
              color: ThemeColors.panelPharmacyShadowColor.withOpacity(0.2),
              offset: Offset(0, 7.h),
              blurRadius: 8.r,
            )
          ]),
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 35.w),
                  Icon(
                    icon,
                    size: 50.h,
                    color: iconColor,
                  ),
                  SizedBox(width: 13.w),
                  Text(widget.name!,
                      style: TextStyle(
                          color: panelTextColor,
                          fontSize: 30.sp,
                          fontFamily: 'Ubuntu')),
                ],
              ),
              InkWell(
                  onTap: () {
                    setState(() {
                      if (height > 90) {
                        isExpanded = false;
                        height = 115.h;
                        counter = 0;
                        return;
                      }
                      height = 300.h;

                      counter = -0.25;
                    });
                  },
                  child: AnimatedRotation(
                    duration: const Duration(milliseconds: 150),
                    turns: counter,
                    child: Padding(
                      padding: EdgeInsets.all(10.0.h),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: iconColor,
                        size: 25,
                      ),
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: 7.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 60.w, right: 30.w),
            child: isExpanded
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text(widget.address!,
                            style: TextStyle(
                                color: panelTextColor,
                                fontSize: 23.sp,
                                fontFamily: 'Ubuntu')),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(TextData.neighborhood,
                                        style: TextStyle(
                                            color: iconColor,
                                            fontSize: 23.sp,
                                            fontFamily: 'UbuntuBlod')),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Text(widget.neighborhood!,
                                        style: TextStyle(
                                            color: panelTextColor,
                                            fontSize: 23.sp,
                                            fontFamily: 'Ubuntu')),
                                  ],
                                ),
                                SizedBox(
                                  height: 18.h,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.phone,
                                      color: iconColor,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Text(widget.phone!,
                                        style: TextStyle(
                                            color: panelTextColor,
                                            fontSize: 23.sp,
                                            fontFamily: 'Ubuntu')),
                                  ],
                                ),
                              ],
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                widget.onTap;
                              },
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 3.w, vertical: 5.h),
                                  primary: panelTextColor,
                                  onPrimary: panelColor),
                              icon: const Icon(Icons.map),
                              label: const Text(TextData.find),
                            )
                          ],
                        )
                      ])
                : null,
          )
        ],
      ),
    );
  }
}
