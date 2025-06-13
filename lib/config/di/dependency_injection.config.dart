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
import 'package:one_cask_at_a_time/core/data/repository/authentication_repository_impl.dart'
    as _i89;
import 'package:one_cask_at_a_time/core/data/sources/authentication_local_data_source.dart'
    as _i404;
import 'package:one_cask_at_a_time/core/domain/domain.dart' as _i510;
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
    gh.factory<_i510.AuthenticationDataSource>(
      () => _i404.AuthenticationLocalDataSource(),
    );
    gh.factory<_i510.AuthenticationRepository>(
      () => _i89.AuthenticationRepositoryImpl(
        gh<_i510.AuthenticationDataSource>(),
      ),
    );
    gh.factory<_i916.SignInCubit>(
      () => _i916.SignInCubit(gh<_i101.AuthenticationRepository>()),
    );
    return this;
  }
}
