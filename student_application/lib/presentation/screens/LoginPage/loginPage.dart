import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_application/logic/bloc/authentication/login/login_bloc.dart';
import 'package:student_application/logic/bloc/authentication/login/login_event.dart';
import 'package:student_application/logic/bloc/authentication/login/login_state.dart';
import 'package:student_application/presentation/screens/LoginPage/OTPemail.dart';
import 'package:student_application/presentation/screens/NavigationPage.dart';
import 'package:student_application/presentation/widgets/MyButton.dart';
import 'package:student_application/presentation/widgets/MyTextField.dart';
import 'package:student_application/presentation/widgets/toggle_button.dart';
import 'package:student_application/service/validation_service.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final FocusNode _focusNode1 =
      FocusNode(); // final FocusNode _focusNode2 = FocusNode();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginLoaded) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Login success full..."),
          ));
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => NavigationPage()),
          );
          return;
        }
        if (state is LoginLoading) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Loading..."),
          ));
          return;
        }
        if (state is LoginError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message!),
          ));
          return;
        }

        // TODO: implement listener
      },
      child: GestureDetector(
        onTap: () {
          // Unfocus text field when tapping outside
          FocusScope.of(context).unfocus();
        },
        child: Form(
          key: _formKey,
          child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Column(
                children: [
                  Stack(
                    children: [
                      _header(),
                    ],
                  ),
                  _contain(context),
                ],
              )),
        ),
      ),
    );
  }

  Widget _header() {
    return Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            SvgPicture.asset("assets/images/doubleCircle.svg"),
            Image.asset(
              "assets/images/banner.png",
              scale: 5,
            ),
          ],
        ),
      ],
    );
  }

  Widget _contain(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
            top: 30.0, left: 20.0, right: 20.0, bottom: 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Login",
                    textScaler: TextScaler.linear(2),
                    style: GoogleFonts.redHatDisplay(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black)),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              SingleChildScrollView(
                child: MyTextField(
                  hint: "Email",
                  focusNode: _focusNode1, // use to tap outside the screen
                  controller: _emailController,
                  prefixIcon: Icon(Icons.mail),
                  keyboardType: TextInputType.emailAddress,
                  validator: ValidationService.validateEmail,
                ),
              ),
              // MyTextField(
              //   label: "Password",
              //   obscureText: true,
              //   controller: _passwordController,
              //   focusNode: _focusNode2,
              //   suffixIcon: ToggleButton(),
              // ),
              PasswordField(passController: _passwordController),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => OTPemail()));
                      },
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.8,
                    child: MyButton(
                      text: "Log In",
                      weight: FontWeight.w600,
                      verticalPadding: 10,
                      horizontalPadding: 0,
                      textSize: 18,
                      color: Color.fromARGB(255, 121, 109, 249),
                      textColor: Colors.white,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<LoginBloc>().add(LoginClickedEvent(
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim()));
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (_) => NavigationPage()));
                        }
                      },
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height / 5.2,
              // ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 5),
                child: Image.asset(
                  "assets/images/london_logo.png",
                  scale: 4,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
