import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/app_core/app_core.dart';
import 'package:movie_app/features/home/bloc/search/search_bloc.dart';
import 'package:movie_app/shared/shared.dart';

/// A widget that represents a search panel in the home view.
/// It is a stateless widget that displays a centered container with a text label.
class SearchPanelWidget extends StatelessWidget {
  /// Creates a [SearchPanelWidget].
  /// This widget does not take any parameters.
  const SearchPanelWidget({super.key});

  /// Creates a page for the [SearchPanelWidget].
  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const SearchPanelWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppTheme.containerGradientBg(),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  children: [
                    ClickableContainerWidget(
                      onTap: () {
                        context.navigator.pop();
                      },
                      child: SvgPicture.asset(AppAssets.iconAngleLeft),
                    ),
                    SizedBox(width: AppDimens.p10),
                    const _SearchWidget(),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Expanded(
                child: Center(
                  child: Text(
                    'Search Panel',
                    style: AppTextStyles.bodyLarge,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchWidget extends StatelessWidget {
  const _SearchWidget();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        onChanged: (value) {
          context.read<SearchBloc>().add(SearchQueryChanged(value));
        },
        decoration: InputDecoration(
          fillColor: AppColors.white.withOpacity(0.1),
          filled: true,
          hintText: 'Search recent movies...',
          hintStyle: AppTextStyles.bodySmall.copyWith(fontSize: AppDimens.p10),
          prefixIcon: SvgPicture.asset(
            AppAssets.iconSearch,
            fit: BoxFit.scaleDown,
          ), // Leading icon

          suffixIcon: SvgPicture.asset(
            AppAssets.iconSearchFilter,
            fit: BoxFit.scaleDown,
          ), // Trailing icon
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.white.withAlpha(100),
            ),
            borderRadius: BorderRadius.circular(AppDimens.p12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.white.withAlpha(250),
            ),
            borderRadius: BorderRadius.circular(AppDimens.p12),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.white.withAlpha(100),
            ),
            borderRadius: BorderRadius.circular(AppDimens.p12),
          ),
        ),
      ),
    );
  }
}
