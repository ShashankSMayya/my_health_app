import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_health_app/data/constants/enums.dart';
import 'package:my_health_app/data/models/document_model.dart';
import 'package:my_health_app/di/get_it.dart' as get_it;
import 'package:my_health_app/presentation/stores/documents_store.dart';
import 'package:my_health_app/presentation/theme/app_theme.dart';
import 'package:my_health_app/routes/route_generator.dart';
import 'package:my_health_app/routes/routes.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DocumentModelAdapter());
  Hive.registerAdapter(FileTypesAdapter());
  unawaited(get_it.init());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final RouteGenerator _routeGenerator = RouteGenerator();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => get_it.getIt<DocumentsStore>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme(context),
        onGenerateRoute: _routeGenerator.generateRoute,
        initialRoute: Routes.home,
      ),
    );
  }
}
