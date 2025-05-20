import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/app_core/app_core.dart';

///
class NavBar extends StatelessWidget {
  ///
  const NavBar({
    required this.onTap,
    required this.pageIndex,
    super.key,
  });

  ///
  final int pageIndex;

  ///
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      height: 100,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(
              0,
              -1,
            ),
            blurRadius: 100,
            spreadRadius: 5,
          ),
        ],
        border: Border(top: BorderSide(color: Colors.black.withAlpha(30))),
        color: AppColors.navbarColor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          navNotHomeItem(
            label: 'Home',
            icon: AppAssets.iconHome,
            selected: pageIndex == 0,
            onTap: () => onTap(0),
          ),
          navNotHomeItem(
            label: 'Wallet',
            icon: AppAssets.iconHeartBroken,
            selected: pageIndex == 1,
            onTap: () => onTap(1),
          ),
          navNotHomeItem(
            label: 'Help',
            icon: AppAssets.iconBell,
            //selectedIcon: Constants.homeIconRed,
            selected: pageIndex == 2,
            onTap: () => onTap(2),
          ),
          navNotHomeItem(
            label: 'Settings',
            icon: AppAssets.iconUserBroken,
            //selectedIcon: Constants.homeIconRed,
            selected: pageIndex == 3,
            onTap: () => onTap(3),
          ),
        ],
      ),
    );
  }

  ///
  Widget navItem({
    required String label,
    required String icon,
    bool selected = false,
    void Function()? onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            SvgPicture.asset(
              icon,
              width: 25,
            ),
          ],
        ),
      ),
    );
  }

  ///
  Widget navNotHomeItem({
    required String label,
    required String icon,
    bool selected = false,
    void Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: selected ? AppColors.primaryDark : null,
        ),
        child: SvgPicture.asset(
          icon,
          width: 30,
          colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
        ),
      ),
    );
  }
}
