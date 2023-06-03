abstract class PeaLoginStates{}

class PeaLoginInitialState extends PeaLoginStates{}

class PeaLoginLoadingState extends PeaLoginStates{}

class PeaLoginSuccessState extends PeaLoginStates{
  final String uId;

  PeaLoginSuccessState(this.uId);
}

class PeaLoginErrorState extends PeaLoginStates{
  final  error;
 PeaLoginErrorState(this.error);
}

class ChangePasswordVisibilityState extends PeaLoginStates{}
