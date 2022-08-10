// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'providers/game.provider.dart' as _i3;
import 'providers/genre.provider.dart' as _i4;
import 'providers/main.provider.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.GameProvider>(_i3.GameProvider());
  gh.singleton<_i4.GenreProvider>(_i4.GenreProvider());
  gh.singleton<_i5.MainProvider>(_i5.MainProvider(get<_i4.GenreProvider>()));
  return get;
}
