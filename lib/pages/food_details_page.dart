import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/ui_models/food_details_args.dart';
import 'package:food_delivery/widgets/custom_back_botton.dart';
import 'package:food_delivery/widgets/favorite_button.dart';
import 'package:food_delivery/widgets/food_details/food_item_counter.dart';
import 'package:food_delivery/widgets/food_details/property_item.dart';

class FoodDetailsPage extends StatelessWidget {
  const FoodDetailsPage({super.key});
  static const String routeName = '/foodDetails';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final FoodDetailsArgs foodArgs =
        ModalRoute.of(context)!.settings.arguments as FoodDetailsArgs;
    final foodindex = foodArgs.foodIndex;
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomBackBotton(
                        onTap: () => Navigator.of(
                          context,
                        ).pop<String>(food[foodindex].name),
                        height: size.height * 0.09,
                        width: size.width * 0.04,
                      ),
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: FavoriteButton(
                          foodIndex: foodindex,
                          width: size.width * 0.1,
                          height: size.height * 0.04,
                        ),
                      ),
                    ],
                    expandedHeight: size.height * 0.33,
                    flexibleSpace: FlexibleSpaceBar(
                      background: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Image.network(
                              food[foodindex].imageUrl,
                              fit: BoxFit.contain,
                              height: size.height * 0.28,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 16,
                      bottom: 46,
                    ),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  food[foodindex].name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  "Buffalo Burger",
                                  style: Theme.of(context).textTheme.bodyLarge!
                                      .copyWith(color: Colors.grey),
                                ),
                              ],
                            ),
                            FoodItemCounter(),
                          ],
                        ),
                        const SizedBox(height: 32.0),

                        IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PropertyItem(
                                propertyName: 'Size',
                                propertyValue: 'Medium',
                              ),
                              VerticalDivider(indent: 0, endIndent: 0),
                              PropertyItem(
                                propertyName: 'Cooking',
                                propertyValue: '10-20 min',
                              ),
                              VerticalDivider(indent: 0, endIndent: 0),
                              PropertyItem(
                                propertyName: 'Calories',
                                propertyValue: '150 Kcal',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'lorem ipsum lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem lorem ipsum lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem',
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),

            // Expanded(
            //   child: SingleChildScrollView(
            //     child: Column(
            //       children: [
            //         TopBanner(foodindex: foodindex),

            //         Padding(
            //           padding: const EdgeInsets.only(
            //             left: 16,
            //             right: 16,
            //             top: 16,
            //             bottom: 46,
            //           ),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   Column(
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       Text(
            //                         food[foodindex].name,
            //                         style: Theme.of(context)
            //                             .textTheme
            //                             .headlineSmall!
            //                             .copyWith(fontWeight: FontWeight.w600),
            //                       ),
            //                       const SizedBox(height: 6),
            //                       Text(
            //                         "Buffalo Burger",
            //                         style: Theme.of(context)
            //                             .textTheme
            //                             .bodyLarge!
            //                             .copyWith(color: Colors.grey),
            //                       ),
            //                     ],
            //                   ),
            //                   FoodItemCounter(),
            //                 ],
            //               ),
            //               const SizedBox(height: 32.0),

            //               IntrinsicHeight(
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: [
            //                     PropertyItem(
            //                       propertyName: 'Size',
            //                       propertyValue: 'Medium',
            //                     ),
            //                     VerticalDivider(indent: 0, endIndent: 0),
            //                     PropertyItem(
            //                       propertyName: 'Cooking',
            //                       propertyValue: '10-20 min',
            //                     ),
            //                     VerticalDivider(indent: 0, endIndent: 0),
            //                     PropertyItem(
            //                       propertyName: 'Calories',
            //                       propertyValue: '150 Kcal',
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               SizedBox(height: 16),
            //               Text(
            //                 'lorem ipsum lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ipsum  lorem ',
            //                 style: Theme.of(context).textTheme.bodyMedium!
            //                     .copyWith(fontWeight: FontWeight.w600),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '\$ ${food[foodindex].price}',
                      style: Theme.of(context).textTheme.headlineMedium!
                          .copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: SizedBox(
                      height: size.height * 0.06,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('checkout'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
