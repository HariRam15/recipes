import 'package:flutter/material.dart';
import 'package:recipes/models/meal.dart';
import 'package:recipes/widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouritesMeals;
  FavouritesScreen(this.favouritesMeals);

  @override
  Widget build(BuildContext context) {
    if (favouritesMeals.isEmpty) {
      return Center(
        child: Container(
          child: Text(
            'You have no Favourites yet, Please add some !',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      );
    } else {
      return ListView.builder(
          itemCount: favouritesMeals.length,
          itemBuilder: (ctx, index) {
            return MealItem(
                id: favouritesMeals[index].id,
                affordability: favouritesMeals[index].affordability,
                complexity: favouritesMeals[index].complexity,
                duration: favouritesMeals[index].duration.toString(),
                imageUrl: favouritesMeals[index].imageUrl,
                title: favouritesMeals[index].title);
          });
    }
  }
}
