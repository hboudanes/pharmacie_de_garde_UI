import 'package:get/get.dart';
import 'package:pharmacie_de_garde_ui/view/pharmacie.dart';

import '/view/splash.dart';
import '/view/home.dart';
class Routes{
List<GetPage<dynamic>>? route = [
        GetPage(name: '/', page: () =>Home()),
        GetPage(name: '/splash', page: () =>Splash() ),
        GetPage(name: '/pharmacie', page: () =>Pharmacie() ),
      ];
}
