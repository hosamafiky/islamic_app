import 'package:equatable/equatable.dart';

class AppError extends Equatable {
  final String message;

  const AppError({required this.message});

  @override
  List<Object?> get props => [message];
}

class ServerError extends AppError {
  const ServerError({required String message}) : super(message: message);
}

class UnhandledError extends AppError {
  const UnhandledError({required String message}) : super(message: message);
}

class NetworkError extends AppError {
  const NetworkError() : super(message: "No Internet Connection");
}
