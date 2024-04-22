import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:student_application/data/repo/authentication/authentication_repo.dart';
import 'package:student_application/logic/bloc/authentication/login/login_bloc.dart';
import 'package:student_application/presentation/screens/LoginPage/loginPage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                LoginBloc(apiRepository: AuthenticationRepo())),
      ],
      child: Material(
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: ThemeData(primarySwatch: Colors.indigo),
        darkTheme: ThemeData(brightness: Brightness.dark),
        home: LoginPage(),
      )),
    );
  }
}
