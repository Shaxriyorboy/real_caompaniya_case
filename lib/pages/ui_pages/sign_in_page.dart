import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);
  static const String id = "sign_in_page";

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controller = TextEditingController();
  bool _validURL = false;
  bool isCheckPassword = true;
  bool isCheckEmail = true;

  _doGetStarted() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade800,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  padding: EdgeInsets.only(top: 90),
                  height: MediaQuery.of(context).size.height,
                  child: Text(
                    'Your Logo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 25.0,
                      right: 25.0,
                    ),
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(height: 60),
                            Text(
                              "Sign in account",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Sign ip to continue",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                              // textAlign: TextAlign.start,
                            ),
                            SizedBox(height: 30),
                            Text(
                              "Email",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: 15),
                            SizedBox(
                              height: 70,
                              child: TextFormField(
                                validator: (input) {
                                  if (EmailValidator.validate(input!)) {
                                    setState(() {
                                      _validURL = true;
                                    });
                                    return null;
                                  } else {
                                    setState(() {
                                      _validURL = false;
                                    });
                                    return "Please enter valid email";
                                  }
                                },
                                controller: _controller,
                                decoration: InputDecoration(
                                    errorBorder: OutlineInputBorder(
                                      gapPadding: 50,
                                    ),
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.all(10),
                                    hintText: 'davin.wong@gamil.com',
                                    suffixIcon: IconButton(
                                      onPressed: () {},
                                      icon: _validURL
                                          ? Icon(
                                              Icons.check_circle_outline,
                                              color: Colors.green,
                                            )
                                          : Icon(
                                              Icons.cancel,
                                            ),
                                    )),
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              "Password",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: 15),
                            SizedBox(
                              height: 50,
                              child: TextField(
                                obscureText: isCheckPassword,
                                obscuringCharacter: '●',
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  border: OutlineInputBorder(),
                                  hintText: 'Password',
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (isCheckPassword) {
                                          isCheckPassword = false;
                                        } else {
                                          isCheckPassword = true;
                                        }
                                      });
                                    },
                                    icon: isCheckPassword
                                        ? Icon(
                                            Icons.remove_red_eye,
                                          )
                                        : Icon(
                                            Icons.visibility_off,
                                          ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black,
                              ),
                              child: MaterialButton(
                                height: 50,
                                minWidth: MediaQuery.of(context).size.width,
                                // shape: StadiumBorder(),
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () {
                                  _doGetStarted();
                                },
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Already have an account? Login",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
