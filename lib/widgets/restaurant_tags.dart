import 'package:flutter/material.dart';

import '../../../models/models2/models.dart';
import '../../../repositories/repositories.dart';
import '../components/blocs/blocs.dart';

class RestaurantTags extends StatelessWidget {
  const RestaurantTags({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: restaurant.tags
          .map(
            (tag) => restaurant.tags.indexOf(tag) == restaurant.tags.length - 1
                ? Text(
                    tag,
                    style: Theme.of(context).textTheme.bodyText1,
                  )
                : Text(
                    '$tag, ',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
          )
          .toList(),
    );
  }
}
