import 'package:application_pizza/recipe.dart';
import 'package:application_pizza/recipeScrenne.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class RecipeListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mes recettes"),
      ),
      body: ListView(
        children: [
          RecipeItemWidget(
              recipe: Recipe(
                  "Pizza Facile",
                  "Par David Silvera",
                  "https://assets.afcdn.com/recipe/20160519/15342_w600.jpg",
                  "Faire cuire dans un poêle les lardons et les champignons",
                  false,
                  50)),
          RecipeItemWidget(
              recipe: Recipe(
                  "Burger Maison",
                  "Par cyril Lignac",
                  "https://cac.img.pmdstatic.net/http.3A.2F.2Fprd2-bone-image.jpg",
                  "Pelez l'oignon rouge puis émincez-le. Rincer et essorez la louche",
                  false,
                  50)),
        ],
      ),
    );
  }
}

class RecipeItemWidget extends StatelessWidget {
  final Recipe recipe;

  const RecipeItemWidget({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
            context,
            '/recipe',
            arguments: recipe,
        );
      },
      child: Card(
        margin: EdgeInsets.all(8),
        elevation: 8,
        child: Row(
          children: [
            Hero(
              tag: 'imageRecippe' + recipe.title,
              child: FadeInImage.memoryNetwork(
                  image: recipe.imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  placeholder: kTransparentImage),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(recipe.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                  Text(
                    recipe.user,
                    style: TextStyle(color: Colors.grey[500], fontSize: 16),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
