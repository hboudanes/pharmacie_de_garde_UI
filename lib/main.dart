import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacie_de_garde_ui/service/admob/ad_help.dart';
import 'package:pharmacie_de_garde_ui/view/home.dart';
import 'package:pharmacie_de_garde_ui/view/splash.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(669.37, 1439.61),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xFF5C4DB1),
            drawerTheme:
                const DrawerThemeData(backgroundColor: Color(0xFFFAFAFA)),
          ),
          home:  Home(),
        );
      },
    );
  }
}
