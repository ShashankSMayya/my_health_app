import 'package:equatable/equatable.dart';

class AppError extends Equatable {
  final AppErrorType appErrorType;
  final String? error;

  const AppError(this.appErrorType, {this.error});

  @override
  List<Object> get props => [appErrorType];
}

enum AppErrorType {
  api,
  network,
  timeout,
  other,
}
