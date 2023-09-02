import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_search/core/constants.dart';
import 'package:github_search/domain/model/search_repo_model.dart';
import 'package:github_search/generated/assets.gen.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({
    Key? key,
    required this.model,
  }) : super(key: key);
  final SearchRepoModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      padding: const EdgeInsets.only(
        left: 16,
        right: 26,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              model.name,
              style: SearchTextStyles.body,
            ),
            SvgPicture.asset(
              model.isSelected
                  ? Assets.svg.favouriteSelectedIcon.path
                  : Assets.svg.favouriteUnselectedIcon.path,
              height: 24,
              width: 24,
            ),
          ],
        ),
      ),
    );
  }
}
