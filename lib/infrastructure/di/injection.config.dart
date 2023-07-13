// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i6;
import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/localStorage/flutterSecureStorage/app_flutter_secure_storage.dart'
    as _i3;
import '../../data/localStorage/sharedPreferences/app_shared_preferences.dart'
    as _i4;
import '../../data/remote/authenticationData/dataProvider/authentication_page_data.dart'
    as _i10;
import '../../data/remote/authenticationData/repo/authentication_page_repo.dart'
    as _i15;
import '../../data/remote/authenticationData/repo/repoInterface/authentication_page_repo_interface.dart'
    as _i14;
import '../../presentation/authenticationPage/bloc/authentication_page_bloc.dart'
    as _i16;
import '../api/apiRequestHelper/api_request_helper.dart' as _i9;
import '../dioClient/connectivityManager/connectivity_manager.dart' as _i12;
import '../dioClient/connectivityManager/model/connection.dart' as _i11;
import '../dioClient/dio_client_module.dart' as _i17;
import '../dioClient/interceptors/authentication_interceptor.dart' as _i5;
import '../dioClient/interceptors/network_interceptor.dart' as _i13;
import '../util/failureResponse/failure_response.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final dioClientModule = _$DioClientModule();
  gh.factory<_i3.AppFlutterSecureStorage>(() => _i3.AppFlutterSecureStorage());
  gh.factory<_i4.AppSharedPreferences>(() => _i4.AppSharedPreferences());
  gh.lazySingleton<_i5.AuthenticationInterceptor>(
      () => _i5.AuthenticationInterceptor(
            get<_i4.AppSharedPreferences>(),
            get<_i3.AppFlutterSecureStorage>(),
          ));
  gh.factory<_i6.Connectivity>(() => dioClientModule.connectivity);
  gh.lazySingleton<_i7.Dio>(() => dioClientModule.dioClient);
  gh.factory<_i8.RetrieveFailedResponseClass>(
      () => _i8.RetrieveFailedResponseClass());
  gh.factory<_i9.ApiRequestHelper>(() => _i9.ApiRequestHelper(
        get<_i6.Connectivity>(),
        get<_i7.Dio>(),
      ));
  gh.factory<_i10.AuthenticationPageData>(() => _i10.AuthenticationPageData(
        get<_i9.ApiRequestHelper>(),
        get<_i8.RetrieveFailedResponseClass>(),
      ));
  gh.lazySingleton<_i11.Connection>(
      () => _i12.ConnectivityManager(get<_i6.Connectivity>()));
  gh.lazySingleton<_i13.NetworkInterceptor>(
      () => _i13.NetworkInterceptor(get<_i11.Connection>()));
  gh.factory<_i14.AuthenticationPageRepoInterface>(
      () => _i15.AuthenticationPageRepo(
            get<_i4.AppSharedPreferences>(),
            get<_i10.AuthenticationPageData>(),
            get<_i3.AppFlutterSecureStorage>(),
            get<_i11.Connection>(),
          ));
  gh.factory<_i16.AuthenticationPageBloc>(() =>
      _i16.AuthenticationPageBloc(get<_i14.AuthenticationPageRepoInterface>()));
  return get;
}

class _$DioClientModule extends _i17.DioClientModule {}
