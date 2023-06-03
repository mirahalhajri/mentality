abstract class PeaRegisterStates{}

class PeaRegisterInitialState extends PeaRegisterStates{}

class PeaRegisterLoadingState extends PeaRegisterStates{}

class PeaRegisterSuccessState extends PeaRegisterStates{}

class PeaRegisterErrorState extends PeaRegisterStates{
  final  error;
 PeaRegisterErrorState(this.error);
}

class PeaCreateUserSuccessState extends PeaRegisterStates{
  final String uId;

  PeaCreateUserSuccessState(this.uId);
}

class PeaCreateUserErrorState extends PeaRegisterStates{
  final  error;
  PeaCreateUserErrorState(this.error);
}

class ChangePasswordPeaRegisterVisibilityState extends PeaRegisterStates{}

class ConfirmPasswordPeaRegisterVisibilityState extends PeaRegisterStates{}
