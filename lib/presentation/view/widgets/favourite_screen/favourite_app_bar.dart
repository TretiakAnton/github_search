part of '../../screens/favourite_screen.dart';

class FavouriteScreenAppBar extends StatelessWidget with PreferredSizeWidget {
  const FavouriteScreenAppBar({Key? key}) : super(key: key);
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
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              context.router.replaceNamed(Routes.searchScreen);
            },
            child: SvgPicture.asset(
              Assets.svg.backIcon.path,
              height: 44,
              width: 44,
            ),
          ),
          const Spacer(),
          Text(
            'Github repos list',
            style: SearchTextStyles.header,
          ),
          const Spacer(),
          const SizedBox(
            width: 44,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
