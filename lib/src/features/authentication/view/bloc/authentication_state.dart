part of 'authentication_cubit.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
  @override
  List<Object> get props => [];
}

class AuthenticationEmpty extends AuthenticationState {
}

class AuthenticationLoading extends AuthenticationState {
}

class AuthenticationError extends AuthenticationState {
  final String message;

  const AuthenticationError(this.message);

  @override
  List<Object> get props => [message];
}


class UserAuthenticated extends AuthenticationState {
  final ProfileEntity profile;

  const UserAuthenticated(this.profile);

  @override
  List<Object> get props => [profile];
}