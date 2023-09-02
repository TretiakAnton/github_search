part of '../screens/search_screen.dart';
/*import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_search/core/constants.dart';
import 'package:github_search/generated/assets.gen.dart';*/

class SearchScreenAppBar extends StatelessWidget with PreferredSizeWidget {
  const SearchScreenAppBar({Key? key}) : super(key: key);
  final double height = 65;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: SearchColors.layer1,
            width: 3,
          ),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 44,
          ),
          const Spacer(),
          Text(
            'Github repos list',
            style: SearchTextStyles.header,
          ),
          const Spacer(),
          SvgPicture.asset(
            Assets.svg.favouriteIcon.path,
            height: 44,
            width: 44,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
