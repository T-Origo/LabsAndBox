import "package:flutter/material.dart";
import 'package:labs/colors.dart';
import 'package:labs/signup.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isSignIn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Kolors.backgroundColor.withOpacity(.85),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Kolors.backgroundColor,
                  image: DecorationImage(
                    image: AssetImage("img/bg.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 17),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Labs N Box",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "NotoSans",
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    //Place for the input forms

                    Positioned(
                      child: Center(
                        child: Container(
                          height: 380,
                          padding: const EdgeInsets.all(15),
                          width: MediaQuery.of(context).size.width - 40,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 15,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isSignIn = true;
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        Text(
                                          "Sign In",
                                          style: TextStyle(
                                            color: isSignIn
                                                ? Kolors.buttonColor
                                                : Kolors.textColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 23,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isSignIn = false;
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        Text(
                                          "Sign up",
                                          style: TextStyle(
                                            color: isSignIn
                                                ? Kolors.textColor
                                                : Kolors.buttonColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 23,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              if (isSignIn) buildSignupSection(),
                              Column(
                                children: [
                                  buildInputField(
                                      "Your Name", false, false, false),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: buildInputField(
                                        "Your email", true, false, false),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: buildInputField("Your Phone Number ",
                                        false, false, true),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: buildInputField(
                                        "Password", false, true, false),
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Kolors.buttonColor,
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        "Register",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "NotoSans",
                                          fontSize: 15,
                                        ),
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Form buildSignupSection() {
    return Form(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildInputField(
              "Registered Email ID/ Phone Number",
              false,
              false,
              false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildInputField(
              "Enter your email",
              true,
              false,
              false,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Kolors.buttonColor,
            ),
            onPressed: () {},
            child: const Text(
              "Sign In",
              style: TextStyle(
                fontFamily: "NotoSans",
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField buildInputField(
    String hintText,
    bool isEmail,
    bool isPassword,
    bool isPhoneNumber,
  ) {
    return TextFormField(
      obscureText: isPassword,
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontFamily: "NotoSans",
          color: Kolors.textColor,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
