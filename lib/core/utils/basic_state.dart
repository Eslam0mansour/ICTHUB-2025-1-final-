enum BasicStates { initial, loading, success, error }

extension BasicStatesX on BasicStates {
  bool get isInitial => this == BasicStates.initial;

  bool get isLoading => this == BasicStates.loading;

  bool get isSuccess => this == BasicStates.success;

  bool get isError => this == BasicStates.error;
}
