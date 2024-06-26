import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:house_rent/bindings/bindings.dart';
import 'package:house_rent/firebase_options.dart';
import 'package:house_rent/views/screens/details_page.dart';
import 'package:house_rent/views/screens/login_page.dart';
import 'package:house_rent/views/screens/main_page.dart';
import 'package:house_rent/views/screens/registration_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = MediaQuery.of(context).platformBrightness;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: brightness == Brightness.light
          ? Brightness.dark
          : Brightness.light, // top status bar icons color
      systemStatusBarContrastEnforced: true,
      systemNavigationBarColor:
          Colors.transparent, // bottom navbar background color
      //systemNavigationBarIconBrightness: Brightness.dark,
    ));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,
        overlays: [SystemUiOverlay.bottom]);
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        builder: (_, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
            ),
            darkTheme: ThemeData.dark(),
            themeMode: ThemeMode.system,
            initialRoute: '/',
            initialBinding: AuthBindings(),
            getPages: [
              GetPage(name: '/', page: () => RegistrationPage()),
              //GetPage(name: '/', page: () => const MainPage(),binding: CategoryBindings()),
              //GetPage(name: '/detailsPage', page: () => DetailsPage(houseModel: Get.arguments,)),
            ],
          );
        });
  }
}
