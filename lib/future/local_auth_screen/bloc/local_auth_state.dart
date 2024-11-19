part of 'local_auth_bloc.dart';

final class LocalAuthState extends Equatable {
  final bool isSuccess;
  final DateTime dateTime;

  const LocalAuthState( {required this.dateTime,this.isSuccess = false});

  LocalAuthState copyWith({bool? isSuccess}) {
    return LocalAuthState(isSuccess: isSuccess ?? this.isSuccess,dateTime: DateTime.now());
  }

  @override
  List<Object?> get props => [isSuccess,dateTime];
}
