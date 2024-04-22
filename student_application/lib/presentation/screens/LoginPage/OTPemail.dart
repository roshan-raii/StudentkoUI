import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_application/presentation/screens/LoginPage/OTPcode.dart';
import 'package:student_application/presentation/widgets/MyButton.dart';
import 'package:student_application/presentation/widgets/MyTextField.dart';
import 'package:student_application/service/validation_service.dart';

class OTPemail extends StatelessWidget {
  final FocusNode _focusNode1 =
      FocusNode(); // final FocusNode _focusNode2 = FocusNode();
  final TextEditingController _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  OTPemail({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Unfocus text field when tapping outside
        FocusScope.of(context).unfocus();
      },
      child: Form(
        key: _formKey,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/otp_verification.png"),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "OTP Verification",
                      style: GoogleFonts.redHatDisplay(
                        textStyle: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("Enter email to send one time password",
                        style: GoogleFonts.redHatDisplay(
                            textStyle: TextStyle(
                                fontSize: 13,
                                color: Color.fromARGB(255, 167, 165, 165)))),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                MyTextField(
                  prefixIcon: Icon(Icons.mail),
                  hint: "Email",
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  focusNode: _focusNode1,
                  validator: ValidationService.validateEmail,
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.15,
                  child: MyButton(
                    text: "Continue",
                    verticalPadding: 8,
                    horizontalPadding: 10,
                    textSize: 20,
                    weight: FontWeight.bold,
                    textColor: Colors.white,
                    color: Color.fromARGB(255, 121, 109, 249),
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => OTPcode()));
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
