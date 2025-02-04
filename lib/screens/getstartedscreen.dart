// ignore_for_file: use_key_in_widget_constructors

import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:coffeeshopapp/data/authrepo.dart';
import 'package:coffeeshopapp/data/orderrepo.dart';

class GetStartedScreen extends StatefulWidget {
  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  bool isloading = false;
  bool login = true;
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passEditingController = TextEditingController();
  PageController pageController = PageController(initialPage: 0);
  int pagenum = 0;
  Color backgroundColor = const Color.fromARGB(255, 230, 153, 0);
  Widget getindicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive
            ? const Color.fromARGB(255, 81, 47, 0)
            : const Color.fromARGB(255, 153, 115, 0),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  List<Widget> buildindicators() {
    List<Widget> list = [];
    for (int i = 0; i <= 2; i++) {
      list.add(i == pagenum ? getindicator(true) : getindicator(false));
    }
    return list;
  }

  List<Widget> getpages() {
    return [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: (MediaQuery.of(context).size.height -
                      MediaQuery.of(context).viewInsets.top -
                      MediaQuery.of(context).viewInsets.bottom) *
                  0.3,
              child: Lottie.asset("assets/page1anim.json",
                  frameRate: FrameRate.max)),
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Welcome to Mocha Moments",
            style: TextStyle(
                color: Color.fromARGB(255, 77, 30, 3),
                fontSize: 25,
                fontFamily: "Coffee Crafts",
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 6,
          ),
          const Text(
            "Discover Exceptional Coffee and Variety",
            style: TextStyle(
                color: Color.fromARGB(178, 68, 25, 0),
                fontSize: 22,
                fontFamily: "Coffee Crafts",
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 16,
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "Welcome to Mocha Moments! Experience the finest and most diverse selection of coffees, including delicious vegan options. Get ready to embark on a journey of exceptional flavors and rich brews.",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Coffee Crafts",
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: (MediaQuery.of(context).size.height -
                      MediaQuery.of(context).viewInsets.top -
                      MediaQuery.of(context).viewInsets.bottom) *
                  0.3,
              child: Stack(
                children: [
                  Lottie.asset("assets/page2anim2.json"),
                  Positioned(
                      bottom: -30,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                          height: (MediaQuery.of(context).size.height -
                                  MediaQuery.of(context).viewInsets.top -
                                  MediaQuery.of(context).viewInsets.bottom) *
                              0.15,
                          child: Lottie.asset("assets/page2anim.json"))),
                ],
              )),
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Earn Rewards with Every Sip",
            style: TextStyle(
                color: Color.fromARGB(255, 77, 30, 3),
                fontSize: 25,
                fontFamily: "Coffee Crafts",
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 6,
          ),
          const Text(
            "Collect Coffee Tokens for Free Treats",
            style: TextStyle(
                color: Color.fromARGB(178, 68, 25, 0),
                fontSize: 22,
                fontFamily: "Coffee Crafts",
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 16,
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "At Mocha Moments, we value your loyalty. Every purchase earns you coffee tokens that unlock free coffees and snacks. Collect tokens, indulge in your favorite brews, and treat yourself on us!",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Coffee Crafts",
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: (MediaQuery.of(context).size.height -
                      MediaQuery.of(context).viewInsets.top -
                      MediaQuery.of(context).viewInsets.bottom) *
                  0.24,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Lottie.asset("assets/page3anim.json"),
                ],
              )),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Indulge in Sweet Delights",
            style: TextStyle(
                color: Color.fromARGB(255, 77, 30, 3),
                fontSize: 25,
                fontFamily: "Coffee Crafts",
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 6,
          ),
          const Text(
            "Cookies, Muffins, and More",
            style: TextStyle(
                color: Color.fromARGB(178, 68, 25, 0),
                fontSize: 22,
                fontFamily: "Coffee Crafts",
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 16,
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "Indulge in more than just coffee at Mocha Moments. Discover our sweet delights like cookies and muffins, perfectly paired with our beverages. Elevate your experience with our delectable snacks.",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Coffee Crafts",
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 160,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return StatefulBuilder(
                    builder: (ctx, setState2) => KeyboardDismisser(
                      child: Scaffold(
                        backgroundColor: Colors.amber,
                        appBar: PreferredSize(
                          preferredSize: const Size.fromHeight(50),
                          child: AppBar(
                            backgroundColor: const Color.fromARGB(0, 249, 153, 57),
                            elevation: 0,
                            centerTitle: true,
                            title: ShaderMask(
                              shaderCallback: (bounds) {
                                return const LinearGradient(colors: [
                                  Color.fromARGB(255, 123, 55, 30),
                                  Color.fromARGB(255, 182, 118, 54),
                                  Color.fromARGB(255, 155, 77, 0)
                                ]).createShader(bounds);
                              },
                              child: const Text(
                                "Mocha Moments",
                                style: TextStyle(
                                    fontFamily: "Food Zone",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                              ),
                            ),
                          ),
                        ),
                        resizeToAvoidBottomInset: false,
                        body: Stack(
                          children: [
                            Positioned(
                              left: 60,
                              right: 60,
                              top: MediaQuery.of(context).size.height * 0.15,
                              child: (!isloading)
                                  ? login
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Text(
                                              "Email Address",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 60, 42, 4),
                                                fontSize: 16,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: TextField(
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                                decoration: const InputDecoration(
                                                  hintText: "",
                                                  border: OutlineInputBorder(),
                                                  focusedBorder:
                                                      OutlineInputBorder(),
                                                  prefixIcon: Padding(
                                                    padding: EdgeInsets
                                                        .symmetric(
                                                        horizontal: 8),
                                                    child: Icon(Icons.email),
                                                  ),
                                                ),
                                                controller:
                                                    emailEditingController,
                                              ),
                                            ),
                                            const Text(
                                              "Password",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 60, 42, 4),
                                                fontSize: 16,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: TextField(
                                                obscureText: true,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                                decoration: const InputDecoration(
                                                  hintText: "",
                                                  border: OutlineInputBorder(),
                                                  focusedBorder:
                                                      OutlineInputBorder(),
                                                  prefixIcon: Padding(
                                                    padding: EdgeInsets
                                                        .symmetric(
                                                        horizontal: 8),
                                                    child: Icon(Icons.password),
                                                  ),
                                                ),
                                                controller:
                                                    passEditingController,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            ElevatedButton(
                                              onPressed: () async {
                                                if (!EmailValidator.validate(
                                                    emailEditingController.text
                                                        .trim())) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(const SnackBar(
                                                          content: Text(
                                                              "Invalid Email Address")));
                                                } else if (passEditingController
                                                        .text
                                                        .trim()
                                                        .length <
                                                    8) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(const SnackBar(
                                                          content: Text(
                                                              "Invalid Password")));
                                                } else {
                                                  setState2(() {
                                                    isloading = true;
                                                  });
                                                  bool success;
                                                  String? message;
                                                  (
                                                    success,
                                                    message
                                                  ) = await GetIt.I
                                                      .get<AuthRepository>()
                                                      .signIn(
                                                          emailEditingController
                                                              .text
                                                              .trim(),
                                                          passEditingController
                                                              .text
                                                              .trim());
                                                  int tokens = 0;
                                                  if (success) {
                                                    tokens = GetIt.I
                                                        .get<OrderRepository>()
                                                        .getTokens();
                                                  }
                                                  setState2(() {
                                                    isloading = false;
                                                  });
                                                  if (success) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(const SnackBar(
                                                            content: Text(
                                                                "Sign In Successful")));
                                                    GetIt.I
                                                        .get<
                                                            SharedPreferences>()
                                                        .setInt(
                                                            "tokens", tokens);
                                                    GetIt.I
                                                        .get<
                                                            SharedPreferences>()
                                                        .setBool(
                                                            "onlyvegan", false);
                                                    GetIt.I
                                                        .get<
                                                            SharedPreferences>()
                                                        .setBool(
                                                            "isinit", false);
                                                    GetIt.I
                                                        .get<
                                                            SharedPreferences>()
                                                        .setString(
                                                            "username",
                                                            GetIt.I
                                                                .get<
                                                                    AuthRepository>()
                                                                .getName());
                                                    Navigator.of(context).pop();
                                                    Navigator.of(context)
                                                        .pushReplacementNamed(
                                                            "/navigation2");
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                            content: Text(
                                                                message!)));
                                                  }
                                                }
                                              },
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 15),
                                                elevation: 30.0,
                                                backgroundColor: Colors.brown,
                                                shadowColor: Colors.amber,
                                                foregroundColor: Colors.amber,
                                              ),
                                              child: const Text(
                                                "Log In",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontFamily:
                                                        "Coffee Crafts"),
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            ElevatedButton(
                                              onPressed: () {
                                                setState2(() {
                                                  login = false;
                                                });
                                              },
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 15),
                                                elevation: 30.0,
                                                backgroundColor: Colors.brown,
                                                shadowColor: Colors.amber,
                                                foregroundColor: Colors.amber,
                                              ),
                                              child: const Text(
                                                "or, Sign Up",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontFamily:
                                                        "Coffee Crafts"),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Text(
                                              "Username",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 60, 42, 4),
                                                fontSize: 16,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: TextField(
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                                decoration: const InputDecoration(
                                                  hintText: "",
                                                  border: OutlineInputBorder(),
                                                  focusedBorder:
                                                      OutlineInputBorder(),
                                                  prefixIcon: Padding(
                                                    padding: EdgeInsets
                                                        .symmetric(
                                                        horizontal: 8),
                                                    child: Icon(Icons
                                                        .account_circle_sharp),
                                                  ),
                                                ),
                                                controller:
                                                    nameEditingController,
                                              ),
                                            ),
                                            const Text(
                                              "Email Address",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 60, 42, 4),
                                                fontSize: 16,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: TextField(
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                                decoration: const InputDecoration(
                                                  hintText: "",
                                                  border: OutlineInputBorder(),
                                                  focusedBorder:
                                                      OutlineInputBorder(),
                                                  prefixIcon: Padding(
                                                    padding: EdgeInsets
                                                        .symmetric(
                                                        horizontal: 8),
                                                    child: Icon(Icons.email),
                                                  ),
                                                ),
                                                controller:
                                                    emailEditingController,
                                              ),
                                            ),
                                            const Text(
                                              "Password",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 60, 42, 4),
                                                fontSize: 16,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: TextField(
                                                obscureText: true,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                                decoration: const InputDecoration(
                                                  hintText: "",
                                                  border: OutlineInputBorder(),
                                                  focusedBorder:
                                                      OutlineInputBorder(),
                                                  prefixIcon: Padding(
                                                    padding: EdgeInsets
                                                        .symmetric(
                                                        horizontal: 8),
                                                    child: Icon(Icons.password),
                                                  ),
                                                ),
                                                controller:
                                                    passEditingController,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            ElevatedButton(
                                              onPressed: () async {
                                                if (nameEditingController.text
                                                        .trim()
                                                        .length <
                                                    3) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(const SnackBar(
                                                          content: Text(
                                                              "Name must be at least 3 characters long")));
                                                } else if (!EmailValidator
                                                    .validate(
                                                        emailEditingController
                                                            .text
                                                            .trim())) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(const SnackBar(
                                                          content: Text(
                                                              "Invalid Email Address")));
                                                } else if (passEditingController
                                                        .text
                                                        .trim()
                                                        .length <
                                                    8) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(const SnackBar(
                                                          content: Text(
                                                              "Password must be at least 8 characters long")));
                                                } else {
                                                  setState2(() {
                                                    isloading = true;
                                                  });
                                                  bool success;
                                                  String? message;
                                                  (
                                                    success,
                                                    message
                                                  ) = await GetIt.I
                                                      .get<AuthRepository>()
                                                      .signUp(
                                                          emailEditingController
                                                              .text
                                                              .trim(),
                                                          passEditingController
                                                              .text
                                                              .trim(),
                                                          nameEditingController
                                                              .text
                                                              .trim());
                                                  if (success) {
                                                    await GetIt.I
                                                        .get<OrderRepository>()
                                                        .updateTokens(0);
                                                  }
                                                  setState2(() {
                                                    isloading = false;
                                                  });
                                                  if (success) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(const SnackBar(
                                                            content: Text(
                                                                "Sign Up Successful")));
                                                    GetIt.I
                                                        .get<
                                                            SharedPreferences>()
                                                        .setInt("tokens", 0);
                                                    GetIt.I
                                                        .get<
                                                            SharedPreferences>()
                                                        .setBool(
                                                            "onlyvegan", false);
                                                    GetIt.I
                                                        .get<
                                                            SharedPreferences>()
                                                        .setBool(
                                                            "isinit", false);
                                                    GetIt.I
                                                        .get<
                                                            SharedPreferences>()
                                                        .setString(
                                                            "username",
                                                            nameEditingController
                                                                .text
                                                                .trim());
                                                    Navigator.of(context).pop();
                                                    Navigator.of(context)
                                                        .pushReplacementNamed(
                                                            "/navigation2");
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                            content: Text(
                                                                message!)));
                                                  }
                                                }
                                              },
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 15),
                                                elevation: 30.0,
                                                backgroundColor: Colors.brown,
                                                shadowColor: Colors.amber,
                                                foregroundColor: Colors.amber,
                                              ),
                                              child: const Text(
                                                "Sign Up",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontFamily:
                                                        "Coffee Crafts"),
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            ElevatedButton(
                                              onPressed: () {
                                                setState2(() {
                                                  login = true;
                                                });
                                              },
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 15),
                                                elevation: 30.0,
                                                backgroundColor: Colors.brown,
                                                shadowColor: Colors.amber,
                                                foregroundColor: Colors.amber,
                                              ),
                                              child: const Text(
                                                "or, Log In",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontFamily:
                                                        "Coffee Crafts"),
                                              ),
                                            ),
                                          ],
                                        )
                                  : Center(
                                      child: Platform.isIOS
                                          ? const CupertinoActivityIndicator(
                                              radius: 20.0,
                                              color: CupertinoColors.activeBlue)
                                          : const CircularProgressIndicator(),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }));
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                elevation: 30.0,
                backgroundColor: Colors.brown,
                shadowColor: Colors.amber,
                foregroundColor: Colors.amber,
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Get Started',
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: "Coffee Crafts",
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.arrow_right_outlined,
                    color: Colors.amber,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.height -
                    MediaQuery.of(context).viewInsets.top -
                    MediaQuery.of(context).viewInsets.bottom) *
                0.8,
            child: PageView(
              controller: pageController,
              onPageChanged: (value) {
                setState(() {
                  switch (value) {
                    case 0:
                      backgroundColor = const Color.fromARGB(255, 230, 153, 0);
                      break;
                    case 1:
                      backgroundColor = const Color.fromARGB(255, 213, 125, 23);
                      break;
                    case 2:
                      backgroundColor = const Color.fromARGB(255, 193, 167, 18);
                      break;
                  }
                  pagenum = value;
                });
              },
              children: getpages(),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: buildindicators(),
          )
        ],
      ),
    );
  }
}
