import 'package:hydrated_bloc/hydrated_bloc.dart';

///@template Bloc observer for the wholen app
class MovieAppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    //print('${bloc.runtimeType} $change');
  }
}
