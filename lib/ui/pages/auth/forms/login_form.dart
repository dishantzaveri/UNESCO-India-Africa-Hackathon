import 'package:flutter/material.dart';
import 'package:partograph/model/user.dart';
import 'package:partograph/provider/auth_provider.dart'; 
import 'package:partograph/ui/pages/home/home_page.dart';
import 'package:partograph/ui/widgets/mobile_text_field.dart';
import 'package:partograph/ui/widgets/password_text_field.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _phoneEditingController = TextEditingController();
  final _passwordEditingController = TextEditingController();

  final _phoneFormFieldKey = GlobalKey<FormFieldState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, model, child) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 60,
              width: 60,
              child: Image.asset("assets/icons/icon.png")),
          Container(
            margin: const EdgeInsets.only(bottom: 60),
            child: const Text(
              "Login",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 150,
            child: Stack(
              children: [
                Container(
                  height: 150,
                  margin: const EdgeInsets.only(
                    right: 70,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(100),
                      bottomRight: Radius.circular(100),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MobileTextfield(
                            hitText: "Phone",
                            labelText: "Phone Number",
                            focusNode: FocusNode(),
                            textEditingController: _phoneEditingController,
                            maxLines: 1,
                            message: "Phone number required",
                            onCodeChange: (country) {
                              model.selectCountry = country;
                            },
                            keyboardType: TextInputType.phone,
                            onChange: (val) {},
                            formFieldKey: _phoneFormFieldKey,
                            country: model.selectedCountry!,
                          ),
                          PasswordTextfield(
                            hitText: "Password",
                            labelText: "Password",
                            focusNode: FocusNode(),
                            textEditingController: _passwordEditingController,
                            maxLines: 1,
                            message: "password required",
                            keyboardType: TextInputType.text,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: model.isSendingAuthData
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              FocusManager.instance.primaryFocus?.unfocus();
                              User _user = User(
                                username: "+" +
                                    model.selectedCountry!.phoneCode +
                                    _phoneEditingController.text
                                        .replaceAll("(", "")
                                        .replaceAll(")", "")
                                        .replaceAll("-", "")
                                        .replaceAll(" ", ""),
                                password: _passwordEditingController.text,
                              );

                              model
                                  .authenticateUser(
                                      user: _user, url: "auth/signin")
                                  .then((value) {
                                if (value) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const HomePage()));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Text(
                                            'Incorect username or password')),
                                  );
                                }
                              });
                            }
                          },
                    child: Container(
                      margin: const EdgeInsets.only(right: 15),
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green[200]!.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xff1bccba),
                            Color(0xff22e2ab),
                          ],
                        ),
                      ),
                      child: model.isSendingAuthData
                          ? Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  SizedBox(
                                    height: 35,
                                    width: 35,
                                    child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.white)),
                                  ),
                                ],
                              ),
                            )
                          : const Icon(
                              Icons.arrow_forward_outlined,
                              color: Colors.white,
                              size: 32,
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.only(right: 16, top: 16),
                  child: Text(
                    "Forgot ?",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
