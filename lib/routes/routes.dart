import 'package:get/get.dart';

import '/view/splash.dart';
import '/view/home.dart';

List<GetPage<dynamic>>? route= [
        GetPage(name: '/', page: () =>Home()),
        GetPage(name: '/splash', page: () =>Splash() ),
        
      ];