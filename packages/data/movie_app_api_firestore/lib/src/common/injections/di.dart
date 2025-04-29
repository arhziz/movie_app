import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_api_firestore/src/common/common.dart';


//import "di.config.dart";

// ignore: public_member_api_docs
final GetIt clientLocator = GetIt.instance;

///Configuring and initializing get it
@injectableInit
void configureHttpClientDependencies(String env) =>
    clientLocator.init(environment: env);
