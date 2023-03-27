import 'package:apiprojecttask/provider/bookProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screen/Startview.dart';
import 'Screen/kindbook.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => BookProvider())],
      child: MaterialApp(home: Startview())));
}


