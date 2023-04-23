import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:usocial/utils/colors.dart';
import 'package:usocial/widgets/textfield_input.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                padding:  const EdgeInsets.all(32),
                width: double.infinity,
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/images/instagram.svg",
                            colorFilter: const ColorFilter.mode(
                                primaryColor, BlendMode.srcIn),
                            height: 64,
                          ),
                          const SizedBox(
                            height: 64,
                          ),
                          TextFieldInput(
                              textEditingController: _emailController,
                              hintText: "Enter your email",
                              textInputType: TextInputType.emailAddress),
                          const SizedBox(
                            height: 24,
                          ),
                          TextFieldInput(
                            textEditingController: _passwordController,
                            hintText: "Enter your password",
                            textInputType: TextInputType.text,
                            isPswd: true,
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          InkWell(
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: const ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4))),
                                  color: blueColor),
                              child: const Text('Log In'),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: const Text("Don't have an account?"),
                              ),
                              GestureDetector(
                                onTap: () => {},
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 2),
                                  child: const Text(
                                    "Sign up.",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                        ]),
                  ),
                ))));
  }
}
