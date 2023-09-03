import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_search/core/constants.dart';
import 'package:github_search/core/routing/routes.dart';
import 'package:github_search/generated/assets.gen.dart';
import 'package:github_search/presentation/state_management/favourite_bloc/favourite_cubit.dart';
import 'package:github_search/presentation/view/widgets/search_result_widget.dart';

part '../widgets/favourite_screen/favourite_app_bar.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FavouriteCubit>();

    return SafeArea(
      child: Scaffold(
        appBar: const FavouriteScreenAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 16,
          ),
          child: Column(
            children: [
              Flexible(
                child: BlocBuilder<FavouriteCubit, FavouriteState>(
                  builder: (context, state) {
                    if (state is FavouriteInProgress) {
                      return const Padding(
                        padding: EdgeInsets.only(
                          top: 24,
                        ),
                        child: CupertinoActivityIndicator(),
                      );
                    } else {
                      return bloc.elements.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount: bloc.elements.length,
                              itemBuilder: (BuildContext context, int index) {
                                return SearchResultWidget(
                                  model: bloc.elements[index],
                                  onTap: (bool isSelected) {
                                    if (isSelected) {
                                      bloc.addSelected(bloc.elements[index]);
                                    } else {
                                      bloc.removeSelected(bloc.elements[index]);
                                    }
                                  },
                                );
                              },
                            )
                          : Center(
                              child: Text(
                                'You have no favorites.\nClick on star while searching to add first favorite',
                                textAlign: TextAlign.center,
                                style: SearchTextStyles.body.copyWith(
                                  color: SearchColors.textPlaceholder,
                                ),
                              ),
                            );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
