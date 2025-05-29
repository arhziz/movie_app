import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/bloc/app_bloc.dart';
import 'package:movie_app/app_core/app_core.dart';
import 'package:movie_app_api/movie_app_api.dart';

///
class TopBarWidget extends StatelessWidget {
  ///
  const TopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _LogoWidget(),
          _UserWidget(
            user: user,
          ),
        ],
      ),
    );
  }
}

class _LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Movie',
        style: AppTextStyles.titleLarge.copyWith(color: AppColors.white),
        children: [
          TextSpan(
            text: 'App',
            style:
                AppTextStyles.titleLarge.copyWith(color: AppColors.primaryDark),
          ),
        ],
      ),
    );
  }
}

class _UserWidget extends StatelessWidget {
  const _UserWidget({required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: AppColors.primaryDark,
        border: Border.all(
          width: 1.5,
          color: AppColors.white.withAlpha(150),
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Text(
                  'Welcome Back',
                  style: AppTextStyles.bodySmall.copyWith(
                    fontSize: 11.sp,
                    color: AppColors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                if (user.fullName.isNotEmpty)
                  Text(
                    user.fullName,
                    style: AppTextStyles.bodySmall.copyWith(
                      fontSize: 12.sp,
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              ],
            ),
          ),
          //if (user.photo.isNotEmpty)
          InkWell(
            onTap: () {
              context.read<AppBloc>().add(const AppLogoutPressed());
            },
            child: const CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
              backgroundColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
