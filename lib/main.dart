import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fourth/data/models/gender_model.dart';
import 'package:flutter_fourth/data/repositories/gender_repository.dart';

import 'business_logic/gender_bloc/gender_bloc.dart';

import 'app_init_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<GenderRepository>(
      create: (context) => GenderRepository(),
      child: BlocProvider(
        create: (context) =>
            GenderBloc(genderModel: context.read<GenderModel>()),
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const AppInitScreen(),
        ),
      ),
    );
  }
}
