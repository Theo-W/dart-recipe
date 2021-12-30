import 'package:application_pizza/favoriteChangeNotifier.dart';
import 'package:application_pizza/favoriteWidget.dart';
import 'package:application_pizza/recipe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class RecipeScrenne extends StatelessWidget {
  final Recipe recipe;

  RecipeScrenne({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(recipe.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20))),
                Text(
                  recipe.user,
                  style: TextStyle(color: Colors.grey[500], fontSize: 16),
                ),
              ],
            )),
            FavoriteIconWidget(),
            FavoriteTextWidget()
          ],
        ));

    Widget buttonSection = Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(Colors.blue, Icons.comment, "COMMENT"),
          _buildButtonColumn(Colors.blue, Icons.share, "SHARE")
        ],
      ),
    );

    Widget descriptionSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        recipe.description,
        softWrap: true,
      ),
    );

    return ChangeNotifierProvider(
      create: (context) => FavoriteChangeNotifier(recipe.isFavorite, recipe.favoriteCount),
      child: Scaffold(
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text("Mes recettes"),
          ),
          body: ListView(children: [
            Hero(
              tag: 'imageRecipe' + recipe.title,
              child: FadeInImage.memoryNetwork(
                  image: recipe.imageUrl,
                  width: 600,
                  height: 240,
                  fit: BoxFit.cover,
                  placeholder: kTransparentImage),
            ),
            titleSection,
            buttonSection,
            descriptionSection,
          ])),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 8),
          child: Icon(icon, color: color),
        ),
        Text(label,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, color: color))
      ],
    );
  }
}
