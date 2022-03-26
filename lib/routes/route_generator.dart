import 'package:flutter/material.dart';
import 'package:my_health_app/presentation/screens/documents/add_document_screen.dart';
import 'package:my_health_app/presentation/screens/documents/view_document_screen.dart';
import 'package:my_health_app/routes/routes.dart';

import '../presentation/screens/home_page.dart';

class RouteGenerator {
  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Routes.addDocument:
        return MaterialPageRoute(builder: (_) => const AddDocumentScreen());
      case Routes.viewDocument:
        return MaterialPageRoute(builder: (_) => const ViewDocumentScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
