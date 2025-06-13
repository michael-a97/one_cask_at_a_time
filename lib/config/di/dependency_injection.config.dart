// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:one_cask_at_a_time/config/router/router.dart' as _i990;
import 'package:one_cask_at_a_time/core/core.dart' as _i101;
import 'package:one_cask_at_a_time/core/data/repository/authentication/authentication_repository_impl.dart'
    as _i964;
import 'package:one_cask_at_a_time/core/data/repository/product/product_repository_impl.dart'
    as _i926;
import 'package:one_cask_at_a_time/core/data/sources/authentication/authentication_local_data_source.dart'
    as _i39;
import 'package:one_cask_at_a_time/core/data/sources/product/product_local_data_source.dart'
    as _i844;
import 'package:one_cask_at_a_time/core/domain/domain.dart' as _i510;
import 'package:one_cask_at_a_time/features/home/application/product_cubit.dart'
    as _i465;
import 'package:one_cask_at_a_time/features/shared/application/connectivity_cubit.dart'
    as _i948;
import 'package:one_cask_at_a_time/features/sign_in/application/sign_in_cubit.dart'
    as _i916;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i990.AppRouter>(() => _i990.AppRouter());
    gh.factory<_i948.ConnectivityCubit>(() => _i948.ConnectivityCubit());
    gh.factory<_i101.ProductDataSource>(() => _i844.ProductLocalDataSource());
    gh.factory<_i510.AuthenticationDataSource>(
      () => _i39.AuthenticationLocalDataSource(),
    );
    gh.factory<_i101.ProductRepository>(
      () => _i926.ProductRepositoryImpl(gh<_i101.ProductDataSource>()),
    );
    gh.factory<_i510.AuthenticationRepository>(
      () => _i964.AuthenticationRepositoryImpl(
        gh<_i510.AuthenticationDataSource>(),
      ),
    );
    gh.factory<_i465.ProductsCubit>(
      () => _i465.ProductsCubit(gh<_i101.ProductRepository>()),
    );
    gh.factory<_i916.SignInCubit>(
      () => _i916.SignInCubit(gh<_i101.AuthenticationRepository>()),
    );
    return this;
  }
}
