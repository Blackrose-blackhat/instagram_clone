import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/colors.dart';

import '../resources/authMethods.dart';
import '../widgets/TextFieldInput.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _repasswordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _repasswordController.dispose();
    _bioController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Container(),
                        flex: 2,
                      ),
                      SvgPicture.asset(
                        'assets/images/ic_instagram.svg',
                        color: primaryColor,
                        height: 64,
                      ),
                      const SizedBox(
                        height: 34,
                      ),
                      Stack(
                        children: const [
                          CircleAvatar(
                            radius: 54,
                            backgroundImage: NetworkImage(
                                'https://media.gq-magazin.de/photos/6436692ac3298d37c8b0ca2f/16:9/w_1280,c_limit/entertainment-film-ghosted-armas.jpg'),
                          ),
                          Positioned(
                            bottom: -2,
                            left: 80,
                            child: Icon(Icons.add_a_photo_outlined),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      TextFieldInput(
                        hintText: 'Enter Your username',
                        isPass: false,
                        textEditingController: _usernameController,
                        textInputType: TextInputType.name,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      TextFieldInput(
                        hintText: 'Enter Your Email Address',
                        isPass: false,
                        textEditingController: _emailController,
                        textInputType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      TextFieldInput(
                        textEditingController: _passwordController,
                        hintText: 'Enter your Password',
                        textInputType: TextInputType.visiblePassword,
                        isPass: true,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      TextFieldInput(
                        textEditingController: _repasswordController,
                        hintText: 'Re - Enter your Password',
                        textInputType: TextInputType.visiblePassword,
                        isPass: true,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      TextFieldInput(
                        textEditingController: _bioController,
                        hintText: 'Enter your bio',
                        textInputType: TextInputType.text,
                        isPass: false,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      InkWell(
                        onTap: () async {
                          String res = await AuthMethods().signupUser(
                              email: _emailController.text,
                              password: _passwordController.text,
                              username: _usernameController.text,
                              bio: _bioController.text);
                          print(res);
                        },
                        child: Container(
                          child: const Text('Sign up'),
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(18),
                          decoration: const ShapeDecoration(
                            color: blueColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(),
                        flex: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text('Already have an account?'),
                          ),
                          Container(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
