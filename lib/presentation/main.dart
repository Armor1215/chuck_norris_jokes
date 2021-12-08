import 'package:chuck_norris_jokes/di.dart';
import 'package:chuck_norris_jokes/presentation/common/bloc/app_bloc_observer.dart';
import 'package:chuck_norris_jokes/presentation/main_screen.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



Future<void> main() async {
  await BlocOverrides.runZoned(
        () async {
      WidgetsFlutterBinding.ensureInitialized();
      EquatableConfig.stringify = true;
      await initDi();

      runApp(const MyApp());
    },
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}
