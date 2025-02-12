import 'package:ict_final/core/utils/basic_state.dart';

class AuthState {
  final BasicStates status;
  final String? errMsg;
  final bool isHidden;

  AuthState({
    this.status = BasicStates.initial,
    this.errMsg,
    this.isHidden = true,
  });

  AuthState copyWith({
    BasicStates? status,
    String? errMsg,
    bool? isHidden,
  }) {
    return AuthState(
      status: status ?? this.status,
      errMsg: errMsg ?? this.errMsg,
      isHidden: isHidden ?? this.isHidden,
    );
  }
}
