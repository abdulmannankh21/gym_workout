import 'package:flutter/material.dart';
import 'package:gym_workout/screens/login_signup_screen.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../sizes.dart';
import '../widgets/custombutton.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
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
                  const Text(
                    ' WORKOUT',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "OTP",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 60,
            ),
            OTPTextField(
              otpFieldStyle: OtpFieldStyle(
                  enabledBorderColor: Colors.white,
                  focusBorderColor: Colors.white),
              length: 6,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 40,
              style: TextStyle(fontSize: 17),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.box,
            ),
            const SizedBox(
              height: 50,
            ),
            CustomButton(
                txt: "Verify",
                width: AppSizes.width! * 0.5,
                hight: AppSizes.height! * 0.05,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginSignUpScreen(isSignup:false)));
                },
                margin: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.blue, Colors.green],
                    ),
                    borderRadius: BorderRadius.circular(40))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Do not recive OTP ? ",
                  style: TextStyle(color: Colors.white, fontSize: 19),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      " Resend ",
                      style: TextStyle(color: Colors.green, fontSize: 22),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
