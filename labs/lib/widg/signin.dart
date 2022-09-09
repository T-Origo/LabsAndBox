import "package:flutter/material.dart";
import 'package:labs/colors.dart';

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
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/bg.png"),
                fit: BoxFit.cover,
              ),
              color: Kolors.backgroundColor,
            ),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
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

                SizedBox(height: 20.0),
                //Place for the input forms

                Center(
                  child: Container(
                    height: isSignIn ? 280 : 420,
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSignIn = true;
                                });
                              },
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  color: isSignIn
                                      ? Kolors.buttonColor
                                      : Kolors.textColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSignIn = false;
                                });
                              },
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                  color: isSignIn
                                      ? Kolors.textColor
                                      : Kolors.buttonColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        // if (isSignIn) buildSignupSection(),
                        isSignIn
                            ? Column(
                                children: [
                                  BuildInputField(
                                    hintText:
                                        "Registered Email ID/Phone Number",
                                    isEmail: true,
                                    isPassword: false,
                                    isPhoneNumber: false,
                                  ),
                                  SizedBox(height: 10),
                                  BuildInputField(
                                    hintText: "Enter your password",
                                    isEmail: false,
                                    isPassword: true,
                                    isPhoneNumber: false,
                                  ),
                                  SizedBox(height: 20),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Kolors.buttonColor,
                                        fixedSize: Size(150, 40),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        "Sign In",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "NotoSans",
                                          fontSize: 15,
                                        ),
                                      ))
                                ],
                              )
                            : Column(
                                children: [
                                  BuildInputField(
                                    hintText: "Your Name",
                                    isEmail: false,
                                    isPassword: false,
                                    isPhoneNumber: false,
                                  ),
                                  SizedBox(height: 10),
                                  BuildInputField(
                                    hintText: "Enter your email",
                                    isEmail: true,
                                    isPassword: false,
                                    isPhoneNumber: false,
                                  ),
                                  SizedBox(height: 10),
                                  BuildInputField(
                                    hintText: "Your Phone Number",
                                    isEmail: false,
                                    isPassword: false,
                                    isPhoneNumber: true,
                                  ),
                                  SizedBox(height: 10),
                                  BuildInputField(
                                    hintText: "Password",
                                    isEmail: false,
                                    isPassword: true,
                                    isPhoneNumber: false,
                                  ),
                                  SizedBox(height: 20),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Kolors.buttonColor,
                                      fixedSize: Size(150, 40),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
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
                                    ),
                                  )
                                ],
                              ),
                      ],
                    ),
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

class BuildInputField extends StatelessWidget {
  final hintText;
  bool isEmail;
  bool isPassword;
  bool isPhoneNumber;

  BuildInputField(
      {this.hintText,
      required this.isEmail,
      required this.isPassword,
      required this.isPhoneNumber});

  @override
  Widget build(BuildContext context) {
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

// Form buildSignupSection() {
//   return Form(
//     child: Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: buildInputField(
//             "Registered Email ID/ Phone Number",
//             false,
//             false,
//             false,
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: buildInputField(
//             "Enter your email",
//             true,
//             false,
//             false,
//           ),
//         ),
//         const SizedBox(
//           height: 30,
//         ),
//         const SizedBox(
//           height: 30,
//         ),
//         ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Kolors.buttonColor,
//           ),
//           onPressed: () {},
//           child: const Text(
//             "Sign In",
//             style: TextStyle(
//               fontFamily: "NotoSans",
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }
