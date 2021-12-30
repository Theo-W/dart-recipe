import 'package:application_pizza/recipe.dart';
import 'package:application_pizza/recipeListScreen.dart';
import 'package:flutter/material.dart';
import 'recipeScrenne.dart';
import 'recipe.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => RecipeListScreen());
      case '/recipe':
        return  PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                RecipeScrenne(recipe: settings.arguments),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              animation =
                  CurvedAnimation(curve: Curves.ease, parent: animation);
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            }
        );
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(title: Text('Error'), centerTitle: true),
              body: Center(
                child: Text("Page Not fount"),
              ),
            )
        );
    }
  }
}