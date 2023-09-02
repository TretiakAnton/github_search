/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_search/core/constants.dart';
import 'package:github_search/generated/assets.gen.dart';
import 'package:github_search/presentation/state_management/login_bloc/search_cubit.dart';*/
part of '../screens/search_screen.dart';

class InputField extends StatelessWidget {
  const InputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FocusNode textFieldFocus = FocusNode();
    TextEditingController controller = TextEditingController();
    final bloc = context.read<SearchCubit>();
    textFieldFocus.addListener(() {
      bloc.focused = textFieldFocus.hasFocus;
    });
    controller.addListener(() {
      bloc.textUpdate = controller.text;
    });
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return TextFormField(
          focusNode: textFieldFocus,
          controller: controller,
          onSaved: (_) {
            bloc.search(controller.text);
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(16),
            filled: true,
            fillColor: bloc.focused
                ? SearchColors.accentSecondary
                : SearchColors.layer1,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                width: 1,
                color: Colors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                width: 1,
                color: SearchColors.accentPrimary,
              ),
            ),
            prefixIconConstraints: const BoxConstraints(
              maxWidth: 50,
              maxHeight: 24,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 10,
              ),
              child: InkWell(
                onTap: () => bloc.search(controller.text),
                child: SvgPicture.asset(
                  Assets.svg.searchInputIcon.path,
                ),
              ),
            ),
            suffixIconConstraints: const BoxConstraints(
              maxWidth: 50,
              maxHeight: 24,
            ),
            suffixIcon: controller.text.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 16,
                    ),
                    child: InkWell(
                      onTap: () {
                        controller.text = '';
                        bloc.textUpdate = '';
                      },
                      child: SvgPicture.asset(Assets.svg.closeIcon.path),
                    ),
                  )
                : const SizedBox(),
            hintText: 'Search',
          ),
        );
      },
    );
  }
}
