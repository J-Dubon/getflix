import 'package:equatable/equatable.dart';

/// This class is abstract to allow condition the functional methods and allow capture the failure events

abstract class Failure extends Equatable {}

// This class capture the failure error the methods to fuctional level
class ErrorFailure extends Failure {
  final Object? error;

  ErrorFailure({
    this.error,
  });

  @override
  List<Object?> get props => [
        error,
      ];
}

// This class capture the failure error the methods to api call service
class ServerFailure extends Failure {
  final Object? message;

  ServerFailure({
    this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

//General failures

class CacheFailure extends Failure {
  final Object? message;

  CacheFailure({
    this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

class ConnectionFailure extends Failure {
  final Object? message;

  ConnectionFailure({
    this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

class AuthenticationFailure extends Failure {
  final Object? message;

  AuthenticationFailure({
    this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

class SynchronizationFailure extends Failure {
  final Object? message;

  SynchronizationFailure({
    this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

class DataBaseFailure extends Failure {
  final Object? message;

  DataBaseFailure({
    this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}
