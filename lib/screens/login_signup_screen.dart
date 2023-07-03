import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gym_workout/screens/otp_screen.dart';
import 'package:gym_workout/screens/profile_setup_age.dart';
import 'package:gym_workout/widgets/customButton.dart';
import 'package:gym_workout/widgets/customTextField.dart';

import '../sizes.dart';

class LoginSignUpScreen extends StatefulWidget {
  var isSignup;
  LoginSignUpScreen(this.isSignup);

  @override
  State<LoginSignUpScreen> createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen> {
  bool isSelected = true;
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> signUp() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      // Show an error message to the user indicating that all fields are required
      return;
    }

    if (password != confirmPassword) {
      // Show an error message to the user indicating that passwords do not match
      return;
    }

    try {
      final userCredential = await signUpWithEmailAndPassword(email, password);

      // Store email and password in Firestore
      await storeUserCredentials(userCredential.user!.uid, email, password);

      // Send email verification
      await userCredential.user!.sendEmailVerification();

      // Navigate to OTP screen
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => LoginSignUpScreen(false)));
    } catch (e) {
      // Handle signup errors
      print('Signup Error: $e');
      // Show an error message to the user or handle the error appropriately
    }
  }

  Future<UserCredential> signUpWithEmailAndPassword(String email, String password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } catch (e) {
      throw e;
    }
  }

  Future<void> storeUserCredentials(String uid, String email, String password) async {
    try {
      await _firestore.collection('users').doc(uid).set({
        'email': email,
        'password': password,
      });
    } catch (e) {
      print('Firestore Error: $e');
      // Show an error message to the user or handle the error appropriately
    }
  }

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      // Show an error message to the user indicating that all fields are required
      return;
    }

    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user!.emailVerified) {
        // Navigate to profile setup age screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfAge()),
        );
      } else {
        // Show a message to the user to verify their email first
        print('Email not verified');
      }
    } catch (e) {
      // Handle login errors
      print('Login Error: $e');
      // Show an error message to the user or handle the error appropriately
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'GYM ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                    Image.asset('assets/icon.png'),
                    const Text(' WORKOUT',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        widget.isSignup = false;
                      });
                    },
                    child: const Text(
                      "SignUp",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Center(
                child: widget.isSignup
                    ? const Text(
                  "Log In",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                )
                    : const Text(
                  "SignUp",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 160,
              ),
              widget.isSignup
                  ? Column(
                children: [
                  CustomTextField(
                    controller: emailController,
                    label: 'Email',
                    keyboardtype: TextInputType.text,
                    hinttxt: "   Email",
                    isobsecure: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    controller: passwordController,
                    label: 'Password',
                    keyboardtype: TextInputType.text,
                    hinttxt: "   Password",
                    isobsecure: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    txt: "LogIn",
                    width: AppSizes.width! * 0.5,
                    hight: AppSizes.height! * 0.05,
                    onPressed: login,
                    margin: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.blue, Colors.green],
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                  )
                ],
              )
                  : Column(
                children: [
                  CustomTextField(
                    controller: emailController,
                    label: 'Email',
                    keyboardtype: TextInputType.text,
                    hinttxt: "   Email",
                    isobsecure: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    controller: passwordController,
                    label: 'Password',
                    keyboardtype: TextInputType.text,
                    hinttxt: "   Password",
                    isobsecure: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    controller: confirmPasswordController,
                    label: 'Confirm Password',
                    keyboardtype: TextInputType.text,
                    hinttxt: "   Confirm Password",
                    isobsecure: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    txt: "SignUp",
                    width: AppSizes.width! * 0.5,
                    hight: AppSizes.height! * 0.05,
                    onPressed: signUp,
                    margin: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.blue, Colors.green],
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
