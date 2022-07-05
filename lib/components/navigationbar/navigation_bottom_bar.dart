import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacie_de_garde_ui/theme/Image_path.dart';

import '../../theme/theme_colors.dart';

class NavigationBottomBar extends StatefulWidget {
  final void Function(int?)? onTap;
  const NavigationBottomBar({Key? key, this.onTap}) : super(key: key);

  @override
  _NavigationBottomBarState createState() => _NavigationBottomBarState();
}

class _NavigationBottomBarState extends State<NavigationBottomBar> {
  int selectBtn = 0;
  List<Map> data = [
    {
      "name": 'Jour',
      "iconData": Icons.nights_stay,
    },
    {
      "name": 'Day',
      "iconData": Icons.light_mode,
    }
  ];
   Color unSelectColor  = Colors.lightBlue;


   Color selectColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 70.0,
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: selectBtn == data.length - 1 ?  Colors.amber: ThemeColors.panelPharmacyColor,
       
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(selectBtn == 0 ? 0.0 : 20.0),
          topRight: Radius.circular(selectBtn == data.length - 1 ? 0.0 : 20.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (int i = 0; i < 2; i++)
            GestureDetector(
              onTap: () {
                widget.onTap!( i);
                setState(() => selectBtn = i);
              },
              child: iconBtn(i),
            ),
        ],
      ),
    );
  }

  SizedBox iconBtn(int i) {
    bool isActive = selectBtn == i ? true : false;
    var height = isActive ? 140.0.h : 0.0;
    var width = isActive ? 120.0.w : 0.0;
    return SizedBox(
      width: 120.0,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: AnimatedContainer(
              height: height,
              width: width,
              duration: const Duration(milliseconds: 300),
              child: isActive
                  ? CustomPaint(
                      painter: ButtonNotch(),
                    )
                  : const SizedBox(),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Icon(
              data.elementAt(i)['iconData'],
              color: isActive ? selectColor : unSelectColor,
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonNotch extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var dotPoint = Offset(size.width / 2, 2.h);

    var paint_1 = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    var paint_2 = Paint()
      ..color = ThemeColors.primary
      ..style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, 0);
    path.quadraticBezierTo(7.5, 0, 12, 5);
    path.quadraticBezierTo(size.width / 2, size.height / 2, size.width - 12, 5);
    path.quadraticBezierTo(size.width - 7.5, 0, size.width, 0);
    path.close();
    canvas.drawPath(path, paint_1);
    canvas.drawCircle(dotPoint, 6, paint_2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}



