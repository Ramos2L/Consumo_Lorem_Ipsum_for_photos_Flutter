import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lorem_ipsum_for_photos/cubit/photos_cubit.dart';
import 'package:lorem_ipsum_for_photos/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: BlocProvider<PhotosCubit>(
        create: (context) => PhotosCubit(), 
        child: const Home()
      )
    );
  }
}