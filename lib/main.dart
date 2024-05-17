import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:insights_news/core/app_colors.dart';
import 'package:insights_news/splash_view.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //هنا انا بقولو قبل ما ترن الابليكيشن عرفلى الكلام اللى تحت

  await Hive.initFlutter();
  await Hive.openBox('user');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily,
          appBarTheme: AppBarTheme(
            color: AppColors.scaffoldBG,
            elevation: 0.0,
          ),
          iconTheme: IconThemeData(color: AppColors.grey),
          scaffoldBackgroundColor: AppColors.scaffoldBG,
          inputDecorationTheme: InputDecorationTheme(
            suffixIconColor: AppColors.lomanada,
            labelStyle: TextStyle(color: AppColors.grey),
            prefixIconColor: AppColors.lomanada,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: AppColors.lomanada)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: AppColors.lomanada)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.red)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.red)),
          )),
      home: const SplashView(),
    );
  }
}
