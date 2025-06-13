import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'connectivity_state.dart';

@injectable
class ConnectivityCubit extends Cubit<ConnectivityState> {
  StreamSubscription<ConnectivityStatus>? _connectivitySubscription;

  ConnectivityCubit() : super(const ConnectivityState());

  Future<void> listen() async {
    _connectivitySubscription = Connectivity().onConnectivityChanged
        .map((result) {
          if (!result.contains(ConnectivityResult.mobile) &&
              !result.contains(ConnectivityResult.wifi) &&
              !result.contains(ConnectivityResult.ethernet)) {
            return ConnectivityStatus.disconnected;
          } else {
            return ConnectivityStatus.connected;
          }
        })
        .listen((status) {
          emit(ConnectivityState(status: status));
        });
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
