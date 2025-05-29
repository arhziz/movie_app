import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/app_core/app_core.dart';
import 'package:movie_app/features/home/bloc/home/home_bloc.dart';
import 'package:movie_app/features/home/widgets/home_widgets/home_widgets.dart';

///
class DiscoverWidget extends StatelessWidget {
  ///
  const DiscoverWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: AppDimens.p14,
        ),
        const _TitleWidget(),
        SizedBox(
          height: AppDimens.p14,
        ),
        const _DiscoveredItemsWidget(),
      ],
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Discover',
          style: AppTextStyles.bodyLarge.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.white,
            fontSize: AppDimens.p20,
          ),
        ),
      ],
    );
  }
}

class _DiscoveredItemsWidget extends StatelessWidget {
  const _DiscoveredItemsWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return switch (state.status) {
          DiscoverStatus.initial => DiscoverEmpty(
              loadMovies: () {
                context.read<HomeBloc>().add(const HomeFetchDiscoverEvent());
              },
            ),
          DiscoverStatus.loading => const DiscoverLoading(),
          DiscoverStatus.failure => DiscoverError(
              loadMovies: () {
                context.read<HomeBloc>().add(const HomeFetchDiscoverEvent());
              },
            ),
          DiscoverStatus.success => DiscoverSuccess(
              discoverMovies: state.discoveredMovies,
            ),
        };
      },
    );
  }
}
