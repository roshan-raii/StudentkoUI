import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_field_bya2/otp_field_bya2.dart';
import 'package:otp_field_bya2/style_bya2.dart';
import 'package:student_application/presentation/screens/LoginPage/NewPassword.dart';

import 'package:student_application/presentation/widgets/MyButton.dart';

class OTPcode extends StatefulWidget {
  OTPcode({super.key});

  @override
  State<OTPcode> createState() => _OTPcodeState();
}

class _OTPcodeState extends State<OTPcode> {
// final FocusNode _focusNode2 = FocusNode();
  final OtpFieldController controller = OtpFieldController();
  // From original otp_text_field package
  // ignore: unused_field
  String _otp = "";

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Form(
        key: _formKey,
        child: Scaffold(
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Verification Code",
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("We gave sent the verification code to your ",
                          style: GoogleFonts.redHatDisplay(
                              textStyle: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 167, 165, 165)))),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("email address",
                          style: GoogleFonts.redHatDisplay(
                              textStyle: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 167, 165, 165)))),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  // OtpField(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OTPFieldByA2(
                        spaceBetween: 5,
                        width: 300,
                        length: 5,
                        controller: controller,
                        fieldStyle: FieldStyle.box,
                        outlineBorderRadius: 5,
                        fieldWidth: 45,
                        onChanged: (otpValue) {
                          setState(() {
                            _otp = otpValue;
                          });
                        },
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 15,
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
                              MaterialPageRoute(builder: (_) => NewPassword()));
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
