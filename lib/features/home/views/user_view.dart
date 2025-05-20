import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/app/bloc/app_bloc.dart';
import 'package:movie_app/app_core/app_core.dart';

///
class UserWidget extends StatelessWidget {
  ///
  const UserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Center(
      child: Text(
        user.email,
        style: AppTextStyles.bodyMedium,
      ),
    );
  }
}
