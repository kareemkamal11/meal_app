
import 'package:flutter/material.dart';
import 'package:meal_app/data/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
    required this.selectMeal,
  });

  final Meal meal;

  final void Function(Meal meal) selectMeal;

  Widget mealInfo({required IconData icon, required String text}) {
    return Row(
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(width: 2),
        Text(
          text.trim().isEmpty ? 'Unknown' : text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 10)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(meal),
      child: Card(
        margin: const EdgeInsets.all(10),
        elevation: 3,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                color: Colors.black54,
                child: Column(
                  children: [
                    Text(
                      // show half of the title
                      meal.title.characters
                          .take(15)
                          .toString(), // هذ يعني انه سيعرض 15 حرف فقط من العنوان
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        mealInfo(
                          icon: Icons.schedule,
                          text: '${meal.duration} min',
                        ),
                        mealInfo(
                          icon: Icons.work,
                          text: meal.complexity.toString().split('.').last,
                        ),
                        mealInfo(
                          icon: Icons.attach_money,
                          text: meal.affordability.toString().split('.').last,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
