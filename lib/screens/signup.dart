import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:usocial/resources/auth_methods.dart';
import 'package:usocial/utils/colors.dart';
import 'package:usocial/widgets/textfield_input.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                width: double.infinity,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Container(),
                      ),
                      SvgPicture.asset(
                        "assets/images/instagram.svg",
                        colorFilter: const ColorFilter.mode(
                            primaryColor, BlendMode.srcIn),
                        height: 64,
                      ),
                      const SizedBox(
                        height: 44,
                      ),
                      // Stack(
                      //   children: [
                      //     const CircleAvatar(
                      //       radius: 50,
                      //       backgroundImage: NetworkImage(
                      //           'https://plus.unsplash.com/premium_photo-1666277012296-a2f0dd57f5fa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80'),
                      //     ),
                      //     Positioned(
                      //         bottom: -10,
                      //         left: 60,
                      //         child: IconButton(
                      //           icon: const Icon(Icons.add_a_photo),
                      //           color: blueColor,
                      //           onPressed: () => {},
                      //         )),
                      //   ],
                      // ),
                      // const SizedBox(
                      //   height: 24,
                      // ),
                      TextFieldInput(
                          textEditingController: _usernameController,
                          hintText: "Enter your username",
                          textInputType: TextInputType.text),
                      const SizedBox(
                        height: 24,
                      ),
                      TextFieldInput(
                          textEditingController: _phoneController,
                          hintText: "Enter your phone",
                          textInputType: TextInputType.phone),
                      const SizedBox(
                        height: 24,
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
                        onTap: () async {
                          String res = await AuthMethods().signupUser(
                            email: _emailController.text,
                            password: _passwordController.text,
                            phone: _phoneController.text,
                            username: _usernameController.text,
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: const ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4))),
                              color: blueColor),
                          child: const Text('Register'),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Flexible(
                        flex: 2,
                        child: Container(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: const Text("Already have an account?"),
                          ),
                          GestureDetector(
                            onTap: () => {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 2),
                              child: const Text(
                                "Log in.",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                    ]))));
  }
}
