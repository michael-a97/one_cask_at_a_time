part of 'connectivity_cubit.dart';

class ConnectivityState extends Equatable {
  final ConnectivityStatus status;

  const ConnectivityState({this.status = ConnectivityStatus.initial});

  @override
  List<Object> get props => [status];
}

enum ConnectivityStatus {
  initial,
  connected,
  disconnected;

  bool get isConnected => this == ConnectivityStatus.connected;

  bool get isDisconnected => this == ConnectivityStatus.disconnected;
}
