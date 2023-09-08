// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i13;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pokemon/core/init/logger/i_logger_manager.dart' as _i3;
import 'package:pokemon/core/init/navigation/i_navigation_service.dart' as _i5;
import 'package:pokemon/core/init/network/i_network_manager.dart' as _i17;
import 'package:pokemon/core/init/secure/i_secure_manager.dart' as _i7;
import 'package:pokemon/core/init/storage/i_storage_manager.dart' as _i9;
import 'package:pokemon/core/init/theme/i_theme_manager.dart' as _i11;
import 'package:pokemon/feature/dashboard/favorites/service/favorites_service.dart'
    as _i24;
import 'package:pokemon/feature/dashboard/favorites/service/i_favorites_service.dart'
    as _i23;
import 'package:pokemon/feature/dashboard/favorites/view_model/favorites_view_model.dart'
    as _i27;
import 'package:pokemon/feature/dashboard/pokemons/_pokemons/service/i_pokemons_service.dart'
    as _i21;
import 'package:pokemon/feature/dashboard/pokemons/_pokemons/service/pokemons_service.dart'
    as _i22;
import 'package:pokemon/feature/dashboard/pokemons/_pokemons/view_model/pokemons_view_model.dart'
    as _i26;
import 'package:pokemon/feature/dashboard/pokemons/pokemon_detail/service/i_pokemon_detail_service.dart'
    as _i19;
import 'package:pokemon/feature/dashboard/pokemons/pokemon_detail/service/pokemon_detail_service.dart'
    as _i20;
import 'package:pokemon/feature/dashboard/pokemons/pokemon_detail/view_model/pokemon_detail_view_model.dart'
    as _i25;
import 'package:pokemon/feature/splash/view_model/splash_view_model.dart'
    as _i16;
import 'package:pokemon/product/init/interceptor/app_interceptor.dart' as _i14;
import 'package:pokemon/product/init/language/language_manager.dart' as _i15;
import 'package:pokemon/product/init/logger/logger_manager.dart' as _i4;
import 'package:pokemon/product/init/navigation/navigation_service.dart' as _i6;
import 'package:pokemon/product/init/network/dio_manager.dart' as _i18;
import 'package:pokemon/product/init/secure/secure_storage_manager.dart' as _i8;
import 'package:pokemon/product/init/storage/hive_manager.dart' as _i10;
import 'package:pokemon/product/init/theme/theme_manager.dart' as _i12;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ILoggerManager>(_i4.LoggerManager());
    gh.singleton<_i5.INavigationService>(_i6.AutoRouterManager());
    gh.singleton<_i7.ISecureManager>(
        _i8.SecureStorageManager(gh<_i3.ILoggerManager>()));
    gh.singleton<_i9.IStorageManager>(
        _i10.HiveManager(gh<_i7.ISecureManager>()));
    gh.singleton<_i11.IThemeManager>(_i12.ThemeManager());
    gh.singleton<_i13.Interceptor>(_i14.AppInterceptor(
      gh<_i3.ILoggerManager>(),
      gh<_i9.IStorageManager>(),
      gh<_i5.INavigationService>(),
    ));
    gh.singleton<_i15.LanguageManager>(_i15.LanguageManager());
    gh.factory<_i16.SplashViewModel>(() => _i16.SplashViewModel());
    gh.singleton<_i17.INetworkManager>(_i18.DioManager(gh<_i13.Interceptor>()));
    gh.factory<_i19.IPokemonDetailService>(
        () => _i20.PokemonDetailService(gh<_i17.INetworkManager>()));
    gh.factory<_i21.IPokemonsService>(
        () => _i22.PokemonsService(gh<_i17.INetworkManager>()));
    gh.factory<_i23.IFavoritesService>(() => _i24.FavoritesService(
          gh<_i17.INetworkManager>(),
          gh<_i9.IStorageManager>(),
        ));
    gh.factory<_i25.PokemonDetailViewModel>(() => _i25.PokemonDetailViewModel(
          gh<_i19.IPokemonDetailService>(),
          gh<_i23.IFavoritesService>(),
        ));
    gh.factory<_i26.PokemonsViewModel>(() => _i26.PokemonsViewModel(
          gh<_i21.IPokemonsService>(),
          gh<_i23.IFavoritesService>(),
        ));
    gh.factory<_i27.FavoritesViewModel>(
        () => _i27.FavoritesViewModel(gh<_i23.IFavoritesService>()));
    return this;
  }
}
