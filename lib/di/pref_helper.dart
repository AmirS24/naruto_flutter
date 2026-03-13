import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:naruto_flutter/di/pref_helper.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();
