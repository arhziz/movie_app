import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/app_core/app_core.dart';
import 'package:movie_app/features/login/views/login_page.dart';
import 'package:movie_app/features/on_boarding/bloc/on_boarding_bloc.dart';
import 'package:movie_app/features/on_boarding/widgets/select_genres_widget.dart';
import 'package:movie_app/shared/shared.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

///on_boarding_view.dart
/// This widget is used to display the onboarding view.
class OnBoardingView extends StatelessWidget {
  /// Creates an instance of [OnBoardingView].
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PageController();
    return BlocListener<OnBoardingBloc, OnBoardingState>(
      listener: (context, state) {
        if (state.status == OnBoardingStatus.completed) {
          Navigator.of(context).push<void>(LoginPage.route());
          //context.navigator.pushReplacement(LoginPage.route());
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextButtonWidget(
            text: 'Skip',
            onPressed: () =>
                context.read<OnBoardingBloc>().add(const OnBoardingCompleted()),
          ),
          Expanded(
            child: PageView(
              controller: controller,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      AppAssets.onboardingImage,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      'Tell us about your favorite movie genres',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(
                      height: AppDimens.p16,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 170,
                    ),
                    const SelectGenresWidget(),
                    const SizedBox(
                      height: 0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: AppDimens.p20,
                        horizontal: AppDimens.p36,
                      ),
                      child: Text(
                        'Select thr genres you \n like to watch',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.titleSmall.copyWith(
                            color: AppColors.white, fontSize: AppDimens.p20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: AppDimens.p16,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimens.p20),
            child: Column(
              children: [
                PrimaryButtonWidget(
                  text: 'Next',
                  onPressed: () {
                    context
                        .read<OnBoardingBloc>()
                        .add(const OnBoardingCompleted());
                  },
                ),
                SizedBox(
                  height: AppDimens.p16,
                ),
                Center(
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: const WormEffect(
                      dotHeight: 5,
                      dotWidth: 50,
                      dotColor: AppColors.secondaryDark,
                      activeDotColor: AppColors.primaryDark,
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimens.p16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
