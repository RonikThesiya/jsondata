import 'package:flutter/material.dart';
import 'package:jsondata/screen/home/provider/provider_screen.dart';
import 'package:jsondata/screen/home/view/home_screen.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(
    ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => HomeScreen(),
        },
      ),
    ),
  );
}