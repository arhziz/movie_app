import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/app_core/app_dimension.dart';
import 'package:movie_app/features/home/bloc/home_bloc.dart';
import 'package:movie_app/features/home/widgets/home_widgets/home_widgets.dart';
import 'package:movie_app_repository/movie_app_repository.dart';

///
class HomeView extends StatelessWidget {
  ///
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(context.read<MovieRepository>())
        ..add(const HomeFetchDiscoverEvent()),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimens.p18),
          child: const Column(
            children: [
              TopBarWidget(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SearchSectionWidget(),
                      CategoriesWidget(),
                      DiscoverWidget(),
                    ],
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
