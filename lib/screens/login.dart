import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signin_template/components/phonesigninbutton.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:signin_template/screens/homescreen.dart';
import 'package:signin_template/screens/signup.dart';
import 'package:signin_template/services/auth.dart';
import '../components/formfeilds.dart';
import '../components/googlesigninbutton.dart';
import '../components/liftedbox.dart';
import '../components/notifier.dart';

class LogInScr extends StatefulWidget {
  const LogInScr({Key? key}) : super(key: key);

  @override
  State<LogInScr> createState() => _LogInScrState();
}

class _LogInScrState extends State<LogInScr> {
  final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController pwdController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String email = "";
  String password = "";
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  late RegExp regExp = RegExp(p);
  bool obsecureTxt = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _scaffoldKey,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.black12,
          body: liftedBoxBuilder(
            child: Stack(children: [
              //=================Backgroung img=====================
              const SizedBox(
                height: double.infinity,
                width: double.infinity,
                // child: Image.asset(
                //   'bgimg',
                //   fit: BoxFit.cover,
                // )
              ),
              //=======Opacity for bg img=============
              Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.white,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //===============================Logo Holder=====================
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20.0, top: 17.0),
                    child: SizedBox(
                      height: 120.0,
                      width: 120.0,
                      child: Center(
                          child: Image(
                        image: AssetImage("assets/images/edukag.png"),
                      )),
                    ),
                  ),
                  //===============Email - password login====================
                  formBuilder(),
                  //Sign up option
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don`t have an account? "),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SignUpScr()));
                        },
                        child: const Text(
                          "Click here",
                          style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                      const Text(" to sign up"),
                    ],
                  ),
                  const Divider(),
                  //==============other sign in options====================
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      "Other Sign-in Options",
                      style: TextStyle(color: Colors.black45),
                    ),
                  ),
                  //Google Sign in
                  FutureBuilder(
                    future: Auth.initializeFirebase(context: context),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Error initializing firebase');
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            GoogleSignInButton(),
                            PhoneOtpSignInButton(),
                          ],
                        );
                      }
                      return const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.orangeAccent,
                        ),
                      );
                    },
                  )
                ],
              ),
            ]),
          )),
    );
  }

  Future<void> validation() async {
    FocusManager.instance.primaryFocus?.unfocus();
    final FormState? form = _formkey.currentState;
    if (form!.validate()) {
      try {
        User? result = await Auth.signInWithEmailAndPassword(email, password);
        if (!mounted) return;
        //print(result.user!.uid);
        if (result != null) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => HomeScr(user: result,)));
        }
      } on Exception catch (e) {
        // print(e);
        Notifiers.showSnackBarScaffoldLock(e.toString(), _scaffoldKey);
      }
    } else {
      // print("No");
      Notifiers.showSnackBarScaffoldLock(
          "Please wait... Processing data", _scaffoldKey);
    }
  }

  Widget formBuilder() {
    return Form(
      //sdfgautovalidateMode: AutovalidateMode.onUserInteraction,
      //autovalidateMode:AutovalidateMode.onUserInteraction,
      key: _formkey,
      child: Column(//direction: Axis.vertical,
          children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child: TxtFrmFld(
              controller: emailController,
              icon: Icons.email,
              onChanged: (value) {
                validation();
                email = value;
                setState(() {
                  validation();
                  email = value.toString().trim();
                  //print("this" + email);
                });
              },
              validator: (value) {
                if (value == "") {
                  return "Please fill the email";
                } else if (!regExp.hasMatch(value!)) {
                  return "Email is Invalid";
                }
                setState(() {
                  email = value.toString().trim();
                });
                return null;
              },
              label: "Email"),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: PwdFrmFld(
            controller: pwdController,
            onChanged: (value) {
              setState(() {
                //validation();
                password = value;
              });
            },
            obsecureTxt: true,
            validator: (value) {
              if (value == "") {
                return 'Please enter the password';
              } else if (value!.length < 8) {
                return "Password too short";
              }
              setState(() {
                password = value.toString().trim();
              });
              return null;
            },
            label: 'Password',
            onTap: () {
              setState(() {
                obsecureTxt = !obsecureTxt;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: SizedBox(
            width: 300,
            height: 65,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: ElevatedButton(
                  onPressed: validation,
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ))),
                  child: const Text("Login")),
            ),
          ),
        )
      ]),
    );
  }

  
}
