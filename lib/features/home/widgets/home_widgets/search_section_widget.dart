import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/app_core/app_core.dart';
import 'package:movie_app/features/home/bloc/bloc.dart';
import 'package:movie_app/features/home/widgets/home_widgets/search_panel_widget.dart';
import 'package:movie_app/shared/shared.dart';

///
class SearchSectionWidget extends StatelessWidget {
  ///
  const SearchSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBloc, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              const _HamburgerMenuWidget(),
              SizedBox(width: AppDimens.p10),
              const _SearchWidget(),
            ],
          ),
        );
      },
    );
  }
}

class _HamburgerMenuWidget extends StatelessWidget {
  const _HamburgerMenuWidget();

  @override
  Widget build(BuildContext context) {
    return ClickableContainerWidget(
      child: SvgPicture.asset(AppAssets.iconMoreVert),
    );
  }
}

class _SearchWidget extends StatelessWidget {
  const _SearchWidget();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          context.navigator.push(
            SlideFromBottomRoute<void>(
              page: const SearchPanelWidget(),
            ),
          );
        },
        child: TextField(
          readOnly: true,
          enabled: false,
          onChanged: (value) {
            //context.read<SearchBloc>().add(SearchQueryChanged(value));
          },
          decoration: InputDecoration(
            fillColor: AppColors.white.withOpacity(0.1),
            filled: true,
            hintText: 'Search recent movies...',
            hintStyle:
                AppTextStyles.bodySmall.copyWith(fontSize: AppDimens.p10),
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
      ),
    );
  }
}
