enum LoadingStatus {
  initial,
  inProgress,
  success,
  failure;

  bool get isInitial => this == LoadingStatus.initial;

  bool get isInProgress => this == LoadingStatus.inProgress;

  bool get isSuccess => this == LoadingStatus.success;

  bool get isFailure => this == LoadingStatus.failure;
}
