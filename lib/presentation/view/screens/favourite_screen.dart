import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_search/presentation/state_management/weather_bloc/weather_cubit.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FavouriteCubit>();

    return SafeArea(
      child: Scaffold(
        body: Container(),
      ),
    );
  }
}
