// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tanzaniasafari/widgets/custom_header.dart';
import 'package:tanzaniasafari/models/activity_model.dart';
import 'package:tanzaniasafari/screens/activity_details_screen.dart';
// ignore: unused_import
import 'package:tanzaniasafari/widgets/clipped_container.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({Key? key}) : super(key: key);

  static const routeName = '/activities';

  @override
  Widget build(BuildContext context) {
    List<Activity> activities = Activity.activities;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          const CustomHeader(title: 'Tour Sites'),
          _ActivitiesMasonryGrid(
            width: width,
            activities: activities,
          ),
        ],
      ),
    );
  }
}

class ClippedContainer extends StatelessWidget {
  const ClippedContainer({
    Key? key,
    required this.activity,
    required List<double> masonryCardHeights,
  }) : super(key: key);

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    final String imageUrl =
        activity.imageUrls.isNotEmpty ? activity.imageUrls[0] : '';

    return Container(
      height: 400,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _ActivitiesMasonryGrid extends StatelessWidget {
  const _ActivitiesMasonryGrid({
    Key? key,
    this.masonryCardHeights = const [200, 250, 300],
    required this.width,
    required this.activities,
  });

  final List<double> masonryCardHeights;
  final double width;
  final List<Activity> activities;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      key: key,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(10.0),
      itemCount: activities.length, // Use the length of the activities list
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      itemBuilder: (context, index) {
        Activity activity = activities[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ActivityDetailsScreen(
                  activity: activity,
                ),
              ),
            );
          },
          child: Column(
            children: [
              Hero(
                tag: '${activity.id}_${activity.title}',
                child: ClippedContainer(
                  key: Key('${activity.id}_${activity.title}'),
                  masonryCardHeights: masonryCardHeights,
                  activity: activity,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                activity.title,
                maxLines: 3,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}
