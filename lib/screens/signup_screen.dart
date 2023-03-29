import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:leocan_work_progress/widgets/bottom_nav_bar.dart';
import 'package:social_login_buttons/social_login_buttons.dart';


class SignUp extends StatelessWidget {
  SignUp({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  // sign user in method
  void signUserIn() {
    if (_formKey.currentState!.validate()) {
      log('valid');
    } else {
      log('not valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
          bottomOpacity: 0,
        elevation: 0,
        leading:
        IconButton(
          icon: const Icon(Icons.arrow_circle_left_outlined),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Create Account",
        ),
        foregroundColor: Colors.black,
        actions:  <Widget>[
          IconButton(
            onPressed: (){

            },
              icon: const Icon(Icons.more_horiz))
        ],
        //titleSpacing: 10,

      ),
      body:SafeArea(
        child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const SizedBox(height: 50,),
                                TextField(
                                  controller: usernameController,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.person_outline_rounded),
                                    border: OutlineInputBorder(
                                        borderRadius:BorderRadius.all(Radius.circular(10)) ),
                                    labelText: 'User name',
                                  ),
                                  obscureText: false,
                                ),
                                const SizedBox(height: 10),
                                const Text("Your email"),
                                const SizedBox(height: 10),
                                TextField(
                                  controller: emailController,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.email_outlined),
                                    border: OutlineInputBorder(
                                        borderRadius:BorderRadius.all(Radius.circular(10))
                                    ),
                                    suffixIcon: Icon(Icons.check),
                                    labelText: 'Email',
                                  ),
                                  obscureText: false,
                                ),
                                const SizedBox(height: 10),
                                const Text("Password"),
                                const SizedBox(height: 10),
                                TextField(
                                  controller: passwordController,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.lock_outline_rounded),
                                    border: OutlineInputBorder(
                                        borderRadius:BorderRadius.all(Radius.circular(10)
                                        )
                                    ),
                                    suffixIcon: Icon(Icons.remove_red_eye_rounded),
                                    labelText: 'Password',
                                  ),
                                  obscureText: true,
                                ),
                                const SizedBox(height: 30),

                                    const SizedBox(height: 10),
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height*0.07,
                                      width: MediaQuery.of(context).size.width*0.9,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const BottomNavBar()));
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                          ),
                                          backgroundColor: Colors.deepPurpleAccent
                                        ),
                                        child: const Text('Create Account'),
                                      ),
                                    ),
                                 const SizedBox(height: 20,),
                                 const Center(child: Text("Or Sign Up with ")),
                                const SizedBox(height: 10,),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height*0.07,
                                  width: MediaQuery.of(context).size.width*0.9,
                                    child: SocialLoginButton(
                                      buttonType: SocialLoginButtonType.google,
                                      text: " Google",
                                      onPressed: () {},
                                    )
                                /*  child: ElevatedButton.icon(
                                    onPressed: () {

                                    },
                                    style: ElevatedButton.styleFrom(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                        ),
                                        backgroundColor: Colors.white
                                    ),
                                    icon: const Icon(Icons.signal_wifi_off),
                                    label: const Text('Google',style: TextStyle(color: Colors.black),),
                                    //child: const Text('Google',style: TextStyle(color: Colors.black),),
                                  ),*/
                                ),
                                const SizedBox(height: 10,),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height*0.07,
                                  width: MediaQuery.of(context).size.width*0.9,
                                    child: SocialLoginButton(
                                      buttonType: SocialLoginButtonType.facebook,
                                      text: " Facebook",
                                      onPressed: () {},


                                    ),
                                  /*child: ElevatedButton(
                                    onPressed: () {
                                    },
                                    style: ElevatedButton.styleFrom(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                        ),
                                        backgroundColor: Colors.white
                                    ),
                                    child: const Text('Facebook',style: TextStyle(color: Colors.black),),
                                  ),*/
                                ),
                                const SizedBox(height: 10),
                                Center(
                                  child: RichText(
                                    text: TextSpan(children: [
                                      const TextSpan(
                                        text: 'Already have account? ',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                          text: 'Login',
                                          style: const TextStyle(
                                            color: Colors.deepPurpleAccent,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {

                                            }),
                                    ]),
                                  ),
                                ),
                              ],
                            ),
              ),
        ),
      ),
    );
  }
}