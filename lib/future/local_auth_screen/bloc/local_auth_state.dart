part of 'local_auth_bloc.dart';

final class LocalAuthState extends Equatable {
  final bool isSuccess;
  final List<String> enteredPin;
  final DateTime dateTime;

  const LocalAuthState(
      {required this.dateTime,
      this.isSuccess = false,
      this.enteredPin = const []});

  LocalAuthState copyWith({bool? isSuccess, List<String>? enteredPin}) {
    return LocalAuthState(
        isSuccess: isSuccess ?? this.isSuccess,
        dateTime: DateTime.now(),
        enteredPin: enteredPin ?? this.enteredPin);
  }

  @override
  List<Object?> get props => [isSuccess, dateTime,enteredPin];
}
