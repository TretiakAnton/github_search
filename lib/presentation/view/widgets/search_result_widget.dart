import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_search/core/constants.dart';
import 'package:github_search/domain/model/search_repo_model.dart';
import 'package:github_search/generated/assets.gen.dart';

class SearchResultWidget extends StatefulWidget {
  const SearchResultWidget({
    Key? key,
    required this.model,
    required this.onTap,
  }) : super(key: key);
  final SearchRepoModel model;
  final Function(bool) onTap;

  @override
  State<SearchResultWidget> createState() => _SearchResultWidgetState();
}

class _SearchResultWidgetState extends State<SearchResultWidget> {
  late bool selected;

  @override
  void initState() {
    selected = widget.model.isSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        height: 55,
        decoration: const BoxDecoration(
          color: SearchColors.layer1,
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
                widget.model.name,
                style: SearchTextStyles.body,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.onTap(!selected);
                    selected = !selected;
                  });
                },
                child: SvgPicture.asset(
                  selected
                      ? Assets.svg.favouriteSelectedIcon.path
                      : Assets.svg.favouriteUnselectedIcon.path,
                  height: 24,
                  width: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
