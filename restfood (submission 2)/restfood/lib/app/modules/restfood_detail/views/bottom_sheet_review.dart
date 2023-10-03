import 'package:flutter/material.dart';
import 'package:restfood/app/constants/constants.dart';

import '../../../models/detail_restaurant.dart';

class BottomSheetReview extends StatelessWidget {
  final DetailRestaurant restaurant;

  const BottomSheetReview({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Review',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              // Padding(
              //   padding: const EdgeInsets.only(right: 16),
              //   child: TextButton(
              //     onPressed: () {
              //       Navigator.pop(context);
              //       showDialog(
              //         context: context,
              //         barrierDismissible: false,
              //         builder: (_) {
              //           return DialogReview(
              //             provider: provider,
              //             restaurantId: restaurant.id,
              //           );
              //         },
              //       );
              //     },
              //     child: const Text(
              //       'Tambah Review',
              //       style: TextStyle(fontWeight: FontWeight.bold),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.only(bottom: 6),
            children: restaurant.customerReviews.map((review) {
              return Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: AppStyles.colors.cyan),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppStyles.colors.cyan,
                        child: const Icon(Icons.person, color: Colors.white),
                      ),
                      title: Text(review.name),
                      subtitle: Text(review.date),
                    ),
                    const Divider(height: 1),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        review.review,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
