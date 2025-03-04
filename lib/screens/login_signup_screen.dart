import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/profile_setup_age.dart';
import '../widgets/custombutton.dart';
import '../widgets/customtextfield.dart';
import 'bottomnavbar.dart';

class LoginSignUpController extends GetxController {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final _preferences = SharedPreferences.getInstance();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> signUp() async {
    final name = nameController.text;
    final email = emailController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty || name.isEmpty) {
      return;
    }

    if (password != confirmPassword) {
      Get.snackbar(
        'Password Not Matched',
        'Both Passwords do not match',
        snackPosition: SnackPosition.TOP,
        backgroundGradient: LinearGradient(
          colors: [Colors.blue, Colors.green],
        ),
        colorText: Colors.red,
      );
      return;
    }

    try {
      final userCredential = await signUpWithEmailAndPassword(email, password);
      storeUserCredentials(userCredential.user!.uid, name, email, password);

      // Send email verification
      await sendEmailVerification();

      // Show snackbar message
      Get.snackbar(
        'Account Created',
        'Your account has been successfully created! Please verify your email.',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
      );

      // Navigate back to the signup screen
      Get.offAll(() => LoginSignUpScreen(isSignup: true));
    } catch (e) {
      print('Signup Error: $e');
    }
  }
  Future<void> sendEmailVerification() async {
    final user = _auth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }
  Future<UserCredential> signUpWithEmailAndPassword(
      String email, String password) async {
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

  Future<void> storeUserCredentials(
      String uid, String name, String email, String password) async {
    try {
      await _firestore.collection('users').doc(uid).set({
        'name': name,
        'email': email,
        'password': password,
      });
    } catch (e) {
      print('Firestore Error: $e');
    }
  }
  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      return;
    }

    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        if (userCredential.user!.emailVerified) {
          Get.snackbar(
            'Login Success',
            'You have successfully logged in!',
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
          );
          final prefs = await _preferences;
          // prefs.setBool('isLoggedIn', true); // Set isLoggedIn to true upon successful login
          final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
          isLoggedIn
              ? Get.offAll(MyNavBar())
              : Get.off(() => ProfAge());
        } else {
          Get.snackbar(
            'Login Failed',
            'Please verify your email before logging in.',
            snackPosition: SnackPosition.TOP,
            backgroundGradient: LinearGradient(
              colors: [Colors.blue, Colors.green],
            ),
            colorText: Colors.red,
          );
        }
      } else {
        Get.snackbar(
          'Login Failed',
          'Invalid email or password. Please try again.',
          snackPosition: SnackPosition.TOP,
          backgroundGradient: LinearGradient(
            colors: [Colors.blue, Colors.green],
          ),
          colorText: Colors.red,
        );
      }
    } catch (e) {
      print('Login Error: $e');
      Get.snackbar(
        'Login Error',
        'An error occurred during login. Please try again.',
        snackPosition: SnackPosition.TOP,
        backgroundGradient: LinearGradient(
          colors: [Colors.blue, Colors.green],
        ),
      );
    }
  }
}
class LoginSignUpScreen extends GetView<LoginSignUpController> {
  final bool isSignup;

  LoginSignUpScreen({this.isSignup = true});


  @override
  Widget build(BuildContext context) {
    Get.put(LoginSignUpController());
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
              const SizedBox(
                height: 60,
              ),
              Center(
                child: isSignup
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
              isSignup
                  ? Column(
                children: [
                  CustomTextField(
                    controller: controller.emailController,
                    label: 'Email',
                    hinttxt: 'Enter your Email',
                    keyboardtype: TextInputType.emailAddress,
                    isobsecure: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    controller: controller.passwordController,
                    label: 'Password',
                    hinttxt: 'Enter your Password',
                    isobsecure: true,
                    keyboardtype: TextInputType.visiblePassword,
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    txt: "Login",
                    width: Get.width * 0.5,
                    hight: Get.height * 0.05,
                    onPressed: controller.login,
                    margin: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.blue, Colors.green],
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ],
              )
                  : Column(
                children: [
                  CustomTextField(
                    controller: controller.nameController,
                    label: 'Name',
                    hinttxt: 'Enter your Name',
                    isobsecure: false,
                    keyboardtype: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    controller: controller.emailController,
                    label: 'Email',
                    hinttxt: 'Enter your Email',
                    keyboardtype: TextInputType.emailAddress,
                    isobsecure: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    controller: controller.passwordController,
                    label: 'Password',
                    hinttxt: 'Enter your Password',
                    keyboardtype: TextInputType.visiblePassword,
                    isobsecure: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    controller: controller.confirmPasswordController,
                    label: 'Confirm Password',
                    hinttxt: 'Enter Confirm Password',
                    isobsecure: true,
                    keyboardtype: TextInputType.visiblePassword,
                  ),
                  CustomButton(
                    txt: "SignUp",
                    width: Get.width * 0.5,
                    hight: Get.height * 0.05,
                    onPressed: controller.signUp,
                    margin: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.blue, Colors.green],
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

