import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:real_companiya_case/pages/ui_pages/create_account_page.dart';
import 'package:real_companiya_case/pages/ui_pages/sign_in_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class UiPage extends StatefulWidget {
  const UiPage({Key? key}) : super(key: key);
  static const String id = '/ui_page';

  @override
  _UiPageState createState() => _UiPageState();
}

class _UiPageState extends State<UiPage>
    with SingleTickerProviderStateMixin {
  final _pageController = PageController();
  List animList = [
    'assets/anims/49415-telegram-icon.json',
    'assets/anims/fast.json',
    'assets/anims/3_free.json',
  ];

  List _listComment = [
    "The world's fastest masseging app. It is free and secure",
    "Telegram deliver messages faster than any other application",
    "Telegram is free forever. No ads. No subscription frees.",
  ];

  List _listContent = [
    'Fast',
    'All Your Favourite',
    'Free',
  ];

  late AnimationController _controller;
  late int count = 0;
  int n = 0;

  @override
  void initState() {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade800,
      body: Stack(
        children: [
          Container(
              margin: EdgeInsets.only(top: 90),
              alignment: Alignment.topCenter,
              child: Text(
                "Your Logo",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
          Container(
            alignment: Alignment.center,
            child: PageView.builder(
                controller: _pageController,
                itemCount: animList.length,
                onPageChanged: (index) {
                  setState(() {
                    count = index;
                  });
                },
                itemBuilder: (context, index) {
                  return _pageBuilder(index);
                }),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white38.withOpacity(0.2),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              alignment: Alignment.bottomCenter,
              height: 270,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green,
                    ),
                    child: MaterialButton(
                      height: 50,
                      minWidth: 300,
                      // shape: StadiumBorder(),
                      child: const Text(
                        "Get Started",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(CreateAccountPage.id);
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black,
                    ),
                    child: MaterialButton(
                      height: 50,
                      minWidth: 300,
                      // shape: StadiumBorder(),
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(SignInPage.id);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 170),
            child: SmoothPageIndicator(
              controller: _pageController,
              count: animList.length,
              effect: WormEffect(
                dotHeight: 8,
                dotWidth: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _pageBuilder(int index) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  _listContent[index],
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(left: 49, right: 49),
                  child: Text(
                    _listComment[index],
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
