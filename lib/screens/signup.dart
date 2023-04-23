import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:usocial/resources/auth_methods.dart';
import 'package:usocial/utils/colors.dart';
import 'package:usocial/utils/imageUtils.dart';
import 'package:usocial/utils/snackBar.dart';
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
  Uint8List? image;
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _usernameController.dispose();
  }

  void selectImage() async {
    bool? isCamera = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text("Camera"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text("Gallery "),
            ),
          ],
        ),
      ),
    );

    if (isCamera == null) return;
    Uint8List? selectedImage =
        await pickImage(isCamera ? ImageSource.camera : ImageSource.gallery);
    setState(() {
      image = selectedImage;
    });
  }

  void signupUserHandler() async {
    setState(() {
      isLoading = true;
    });
    String res = await AuthMethods().signupUser(
        email: _emailController.text,
        password: _passwordController.text,
        phone: _phoneController.text,
        username: _usernameController.text,
        file: image!);
    setState(() {
      isLoading = false;
    });
    if (res != 'success') {
      showSnackBar(res, context);
    } else {
      showSnackBar("register", context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(32),
          width: double.infinity,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/images/instagram.svg",
                      colorFilter:
                          const ColorFilter.mode(primaryColor, BlendMode.srcIn),
                      height: 64,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Stack(
                      children: [
                        image != null
                            ? CircleAvatar(
                                radius: 50,
                                backgroundImage: MemoryImage(image!),
                              )
                            : const CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage(
                                    'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg'),
                              ),
                        Positioned(
                            bottom: -10,
                            left: 60,
                            child: IconButton(
                              icon: const Icon(Icons.add_a_photo),
                              color: blueColor,
                              onPressed: selectImage,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
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
                      onTap: signupUserHandler,
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                            color: blueColor),
                        child: isLoading
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: primaryColor,
                                ),
                              )
                            : const Text('Register'),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
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
                    // const SizedBox(
                    //   height: 12,
                    // ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
