import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_application/presentation/screens/LoginPage/loginPage.dart';
import 'package:student_application/presentation/widgets/MyButton.dart';
import 'package:student_application/presentation/widgets/MyTextField.dart';

class NewPassword extends StatefulWidget {
  NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final TextEditingController _newPassword = TextEditingController();

  final TextEditingController _confirmNewPassword = TextEditingController();

  bool obscurePassword = true;

  Icon visible = const Icon(Icons.visibility, color: Colors.black);

  Icon nonVisible = const Icon(Icons.visibility_off, color: Colors.black);

  Widget toggleButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: IconButton(
        icon: obscurePassword ? visible : nonVisible,
        onPressed: () {
          setState(() {
            obscurePassword = !obscurePassword;
          });
        },
      ),
    );
  }

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
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Enter your new password",
                        style: GoogleFonts.redHatDisplay(
                            textStyle: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black))),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("A strong password is your first line of defense ",
                        style: GoogleFonts.redHatDisplay(
                            textStyle: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 167, 165, 165)))),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("against intruders and imposters.",
                        style: GoogleFonts.redHatDisplay(
                            textStyle: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 167, 165, 165)))),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                MyTextField(
                    hint: "Enter new password",
                    controller: _newPassword,
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: toggleButton(),
                    obscureText: obscurePassword,
                    validator: (val) {
                      if (val!.isEmpty)
                        return 'Enter new password';
                      else if (val.length < 6) {
                        return "Password must be atleast 6 characters long";
                      } else {
                        return null;
                      }
                    }),
                MyTextField(
                    hint: "Confirm new password",
                    controller: _confirmNewPassword,
                    obscureText: obscurePassword,
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: toggleButton(),
                    validator: (val) {
                      if (val!.isEmpty)
                        return 'Enter new password';
                      else if (val.length < 6) {
                        return "Password must be atleast 6 characters long";
                      }
                      if (val != _newPassword.text)
                        return 'Password does not match';
                      return null;
                    }),
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
                            MaterialPageRoute(builder: (_) => LoginPage()));
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
