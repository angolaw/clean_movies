import 'package:clean_movies/common/constants/size_constants.dart';
import 'package:clean_movies/common/extensions/size_extension.dart';
import 'package:clean_movies/presentation/journeys/drawer/navigation_expanded_list_item.dart';
import 'package:clean_movies/presentation/journeys/drawer/navigation_list_item.dart';
import 'package:clean_movies/presentation/widgets/logo.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.dimen_300.w.toDouble(),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.7),
              blurRadius: 4),
        ],
      ),
      child: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: Sizes.dimen_8.h.toDouble(),
                left: Sizes.dimen_8.w.toDouble(),
                right: Sizes.dimen_8.h.toDouble(),
                bottom: Sizes.dimen_8.h.toDouble()),
            child: Logo(
              height: Sizes.dimen_20.h.toDouble(),
            ),
          ),
          //1
          NavigationListItem(
            title: 'Favorite Movies',
            onPressed: () {},
          ),
          NavigationExpandedListItem(
            title: 'Language',
            //1
            children: [
              'English',
              'Spanish',
            ],
            onPressed: (index) {},
          ),
          NavigationListItem(
            title: 'Feedback',
            onPressed: () {},
          ),
          NavigationListItem(
            title: 'About',
            onPressed: () {},
          ),
        ],
      )),
    );
  }
}