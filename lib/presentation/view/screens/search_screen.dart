import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_search/core/constants.dart';
import 'package:github_search/core/routing/routes.dart';
import 'package:github_search/generated/assets.gen.dart';
import 'package:github_search/presentation/state_management/search_bloc/search_cubit.dart';
import 'package:github_search/presentation/view/widgets/search_result_widget.dart';

part '../widgets/search_screen/custom_input.dart';

part '../widgets/search_screen/search_app_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SearchCubit>();
    return SafeArea(
      child: Scaffold(
        appBar: const SearchScreenAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 16,
          ),
          child: Column(
            children: [
              const CustomInput(),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: BlocBuilder<SearchCubit, SearchState>(
                      builder: (context, state) {
                        return Text(
                          bloc.searchMade ? 'What we found' : 'Search history',
                          style: SearchTextStyles.header
                              .copyWith(color: SearchColors.accentPrimary),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Flexible(
                child: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (state is SearchInProgress) {
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
                                bloc.searchMade
                                    ? 'Nothing was find for your search.\nPlease check the spelling'
                                    : 'You have empty history.\nClick on search to start journey!',
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
