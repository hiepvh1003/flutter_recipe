import 'package:flutter/material.dart';
import 'recipe.dart';
import 'recipe_detail.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    final ThemeData theme = ThemeData();

    return MaterialApp(
      title: 'Recipe Calculator',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.grey,
          secondary: Colors.black,
        ),
      ),
      home: const MyHomePage(title: 'Recipe Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: ListView.builder(
          itemCount: Recipe.samples.length,
          itemBuilder: (BuildContext context, int index) {
            // TODO : Update to return Recipe card
            // TODO: Add GestureDetector
            // Introduces a GestureDetector widget, which, as the name implies, detects gestures.
            return GestureDetector(
              // Implements an onTap function, which is the callback called when the widget is tapped.
              onTap: () {
                // The Navigator widget manages a stack of pages.
                // Calling push() with a MaterialPageRoute will push a new Material page onto the stack
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      // 10
                      // TODO: Replace return with return RecipeDetail()
                      return RecipeDetail(recipe: Recipe.samples[index]);
                    },
                  ),
                );
              },
              // 11
              child: buildRecipeCard(Recipe.samples[index]),
            );

          },
        )
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  // TODO: Add buildRecipeCard() here
  Widget buildRecipeCard(Recipe recipe) {
    return Card(

      // A card’s elevation determines how high off the screen the card is, affecting its shadow.
      elevation: 2.0,

      // Shape handles the shape of the card. This code defines a rounded rectangle with a 10.0 corner radius.
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),

      // Padding insets its child’s contents by the specified padding value.
      child: Padding(

        padding: const EdgeInsets.all(16.0),

        child: Column(
          children: <Widget>[
            Image(image: AssetImage(recipe.imageUrl)),

            const SizedBox(
              height: 14.0,
            ),

            Text(
                recipe.label,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Palatino',
                )
            )
          ],
        ),
      ),
    );
  }
}
