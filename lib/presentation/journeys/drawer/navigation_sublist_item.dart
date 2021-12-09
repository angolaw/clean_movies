import 'package:clean_movies/common/extensions/size_extension.dart';
import 'package:flutter/material.dart';

class NavigationSubListItem extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const NavigationSubListItem(
      {Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor,
              blurRadius: 2,
            ),
          ],
        ),
        child: ListTile(
          //1
          contentPadding: EdgeInsets.symmetric(horizontal: 32.w),
          title: Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ),
    );
  }
}
