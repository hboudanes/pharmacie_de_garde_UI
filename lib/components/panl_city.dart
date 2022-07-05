import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacie_de_garde_ui/theme/text_data.dart';
import 'package:pharmacie_de_garde_ui/theme/theme_text_style.dart';

import '/theme/theme_colors.dart';

class PanlCity extends StatefulWidget {
  final String? name;
  final String? scheduleNight;
  final String? scheduleDay;
  final String? ondutyDate;
  final void Function()? onTap;
  const PanlCity(
      {Key? key,
      this.name,
      this.scheduleNight,
      this.scheduleDay,
      this.ondutyDate,
      this.onTap
      })
      : super(key: key);

  @override
  State<PanlCity> createState() => _PanlCityState();
}

class _PanlCityState extends State<PanlCity> {
  bool isExpanded = false;
  double height = 115.h;
  double counter = 0;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: AnimatedContainer(
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
            color: ThemeColors.panlCityBackground,
            borderRadius: BorderRadius.circular(54.r)),
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
                      Icons.apartment,
                      size: 24.h,
                      color: ThemeColors.primary,
                    ),
                    SizedBox(width: 13.w),
                    Text(widget.name!, style: ThemeTextStyle().panalTitle),
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
                        height = 250.h;

                        counter = -0.25;
                      });
                    },
                    child: AnimatedRotation(
                      duration: const Duration(milliseconds: 150),
                      turns: counter,
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: ThemeColors.primary,
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
              padding: EdgeInsets.only(left: 56.w),
              child: isExpanded
                  ? Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              TextData.valid,
                              style: ThemeTextStyle().panalSubTitleMedium,
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              widget.ondutyDate!,
                              style: ThemeTextStyle().panalSubTitle,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.light_mode,
                              size: 24.h,
                              color: ThemeColors.iconInDay,
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              widget.scheduleDay!,
                              style: ThemeTextStyle().panaltext,
                            ),
                          ],
                        ),
                        SizedBox(height: 14.w),
                        Row(
                          children: [
                            Icon(
                              Icons.nights_stay,
                              size: 24.h,
                              color: Colors.black,
                            ),
                            SizedBox(width: 12.w),
                            Text(widget.scheduleNight!,
                                style: ThemeTextStyle().panaltext),
                          ],
                        )
                      ],
                    )
                  : null,
            )
          ],
        ),
      ),
    );
  }
}
