import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_search/core/constants.dart';
import 'package:github_search/generated/assets.gen.dart';
import 'package:github_search/presentation/state_management/login_bloc/search_cubit.dart';
import 'package:github_search/presentation/view/widgets/search_result_widget.dart';

part '../widgets/search_screen/input_field.dart';
part '../widgets/search_screen/search_screen_app_bar.dart.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SearchCubit>();

    return SafeArea(
      child: Scaffold(
        appBar: const SearchScreenAppBar(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 16,
            ),
            child: Column(
              children: [
                const InputField(),
                BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (state is SearchInitial || state is SearchInProgress) {
                      if (state is SearchInitial) {
                        bloc.getLastSearch();
                      }
                      return const Center(
                        child: CupertinoActivityIndicator(),
                      );
                    } else {
                      return bloc.searchResult.isNotEmpty &&
                              bloc.lastSearch.isNotEmpty
                          ? ListView.builder(
                              itemCount: bloc.searchResult.length,
                              itemBuilder: (BuildContext context, int index) {
                                return SearchResultWidget(
                                  model: bloc.searchResult[index],
                                );
                              },
                            )
                          : Center(
                              child: Text(
                                bloc.searchMade
                                    ? 'Nothing was find for your search.\nPlease check the spelling'
                                    : 'You have empty history.\nClick on search to start journey!',
                                style: SearchTextStyles.body.copyWith(
                                  color: SearchColors.textPlaceholder,
                                ),
                              ),
                            );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
