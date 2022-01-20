import 'package:flutter/material.dart';
import 'package:real_companiya_case/pages/home_page.dart';
import 'package:real_companiya_case/pages/location_page.dart';
import 'package:real_companiya_case/pages/new_version_page.dart';
import 'package:real_companiya_case/pages/rich_text_hash_tag_page.dart';
import 'package:real_companiya_case/pages/ui_pages/create_account_page.dart';
import 'package:real_companiya_case/pages/ui_pages/sign_in_page.dart';
import 'package:real_companiya_case/pages/ui_pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        RichTextHashTag.id:(context) => RichTextHashTag(),
        HomePage.id:(context)=>HomePage(),
        LocationPage.id:(context) =>LocationPage(),
        NewVersionPage.id:(context) => NewVersionPage(),
        UiPage.id:(context) => UiPage(),
        CreateAccountPage.id:(context) => CreateAccountPage(),
        SignInPage.id:(context) => SignInPage(),
      },
    );
  }
}
