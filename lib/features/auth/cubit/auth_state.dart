// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_cubit.dart';

abstract class AuthState  {

}

 class AuthInitial extends AuthState {}

 class AuthLoading extends AuthState {}

 class AuthSuccess extends AuthState {
}

class AuthFailure extends AuthState {
  final String? errorMessage;

   AuthFailure({
     this.errorMessage,
  });
}
