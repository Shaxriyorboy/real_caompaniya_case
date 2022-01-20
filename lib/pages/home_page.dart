import 'package:flutter/material.dart';
import 'package:real_companiya_case/pages/location_page.dart';
import 'package:real_companiya_case/pages/new_version_page.dart';
import 'package:real_companiya_case/pages/rich_text_hash_tag_page.dart';
import 'package:real_companiya_case/pages/ui_pages/splash_page.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
        backgroundColor: Colors.transparent,
        // elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(RichTextHashTag.id);
                },
                child: Text("Open RichText"),
                color: Colors.blue,
              ),
              SizedBox(height: 10,),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(LocationPage.id);
                },
                child: Text("Open Location"),
                color: Colors.blue,
              ),
              SizedBox(height: 10,),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(NewVersionPage.id);
                },
                child: Text("Open New Version"),
                color: Colors.blue,
              ),
              SizedBox(height: 10,),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(UiPage.id);
                },
                child: Text("Open Ui Page"),
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
