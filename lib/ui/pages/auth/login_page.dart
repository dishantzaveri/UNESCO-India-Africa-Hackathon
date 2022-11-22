import 'package:flutter/material.dart';
import 'package:mother_and_baby/ui/pages/auth/fade_animation.dart';
import 'package:mother_and_baby/ui/pages/home/home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final _numberEditingController = TextEditingController();
  final _passwordEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/image-2.png'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      // Positioned(
                      //   left: 30,
                      //   width: 80,
                      //   height: 200,
                      //   child: FadeAnimation(
                      //       delay: 1,
                      //       childWidget: Container(
                      //         decoration: const BoxDecoration(
                      //             image: DecorationImage(
                      //                 image: AssetImage(
                      //                     'assets/images/light-1.png'))),
                      //       )),
                      // ),
                      // Positioned(
                      //   left: 140,
                      //   width: 80,
                      //   height: 150,
                      //   child: FadeAnimation(
                      //       delay: 1.3,
                      //       childWidget: Container(
                      //         decoration: const BoxDecoration(
                      //             image: DecorationImage(
                      //                 image: AssetImage(
                      //                     'assets/images/light-2.png'))),
                      //       )),
                      // ),
                      // Positioned(
                      //   right: 40,
                      //   top: 40,
                      //   width: 80,
                      //   height: 150,
                      //   child: FadeAnimation(
                      //       delay: 1.5,
                      //       childWidget: Container(
                      //         decoration: const BoxDecoration(
                      //             image: DecorationImage(
                      //                 image: AssetImage(
                      //                     'assets/images/clock.png'))),
                      //       )),
                      // ),
                      // Positioned(
                      //   child: FadeAnimation(
                      //       delay: 1.6,
                      //       childWidget: Container(
                      //         margin: const EdgeInsets.only(top: 50),
                      //         child: const Center(
                      //           child: Text(
                      //             "Login",
                      //             style: TextStyle(
                      //                 color: Colors.white,
                      //                 fontSize: 40,
                      //                 fontWeight: FontWeight.bold),
                      //           ),
                      //         ),
                      //       )),
                      // )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      // FadeAnimation(
                      //     delay: 1.8,
                      //     childWidget: Container(
                      //       padding: const EdgeInsets.all(5),
                      //       decoration: BoxDecoration(
                      //           color: Colors.white,
                      //           borderRadius: BorderRadius.circular(10),
                      //           boxShadow: const [
                      //             BoxShadow(
                      //                 color: Color.fromRGBO(248, 54, 119, 1),
                      //                 blurRadius: 20.0,
                      //                 offset: Offset(0, 10))
                      //           ]),
                      //       child: Column(
                      //         children: <Widget>[
                      //           Container(
                      //             padding: const EdgeInsets.all(8.0),
                      //             decoration: const BoxDecoration(
                      //                 border: Border(
                      //                     bottom:
                      //                         BorderSide(color: Colors.grey))),
                      //             child: TextFormField(
                      //               focusNode: FocusNode(),
                      //               validator: (value) {
                      //                 if (value == null || value.isEmpty) {
                      //                   return "Registration number is required";
                      //                 } else {
                      //                   return null;
                      //                 }
                      //               },
                      //               controller: _numberEditingController,
                      //               decoration: InputDecoration(
                      //                   border: InputBorder.none,
                      //                   hintText: "Username",
                      //                   hintStyle:
                      //                       TextStyle(color: Colors.grey[400])),
                      //             ),
                      //           ),
                      //           Container(
                      //             padding: const EdgeInsets.all(8.0),
                      //             child: TextFormField(
                      //               focusNode: FocusNode(),
                      //               obscureText: true,
                      //               validator: (value) {
                      //                 if (value == null || value.isEmpty) {
                      //                   return "Password is required";
                      //                 } else {
                      //                   return null;
                      //                 }
                      //               },
                      //               controller: _passwordEditingController,
                      //               decoration: InputDecoration(
                      //                   border: InputBorder.none,
                      //                   hintText: "Password",
                      //                   hintStyle:
                      //                       TextStyle(color: Colors.grey[400])),
                      //             ),
                      //           )
                      //         ],
                      //       ),
                      //     )),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                          // onTap: () {
                          //   if (_formKey.currentState!.validate()) {
                          //     if (_numberEditingController.text.toLowerCase() ==
                          //             "md001" &&
                          //         _passwordEditingController.text.toLowerCase() ==
                          //             "1234") {
                          //       Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //               builder: (_) => const HomePage()));
                          //     } else {
                          //       Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //               builder: (_) => const HomePage()));
                          //     }
                          //   }
                          //   //  else {}
                          // },
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const HomePage()));
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(colors: [
                                  Color.fromRGBO(248, 54, 119, 1),
                                  Color.fromARGB(255, 228, 118, 155),
                                ])),
                            child: const Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),

                      const SizedBox(
                        height: 70,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
