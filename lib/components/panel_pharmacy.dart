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
  final void Function()? onPressed;
  final bool? mode; //change color theme between night and day
  const PanelPharmacy(
      {Key? key,
      this.name,
      this.address="null",
      this.neighborhood=" ",
      this.coordinates="",
      this.phone="",
      required this.onPressed,
      this.mode})
      : super(key: key);

  @override
  State<PanelPharmacy> createState() => _PanelPharmacyState();
}

class _PanelPharmacyState extends State<PanelPharmacy> {
  bool isExpanded = false;
  double height = 115.h;
  double counter = 0;

  @override
  Widget build(BuildContext context) {
    Color iconColor = widget.mode!
        ? Colors.white
        : Colors
            .black87; //if mode is true => night => black and if mode is False => Day => black white

    Color panelColor = widget.mode!
        ? ThemeColors.panelPharmacyColor
        : ThemeColors.panelPharmacyTextColor;
    Color panelTextColor = widget.mode!
        ? ThemeColors.panelPharmacyTextColor
        : ThemeColors.panelPharmacyColor;
    // change betwen panalColor and panelPharmacyTextColor if mode is true => night => panalColor =panelPharmacyColor and Day ...
    IconData icon = widget.mode! ? Icons.nights_stay : Icons.light_mode;
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                              onPressed:widget.onPressed,
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
