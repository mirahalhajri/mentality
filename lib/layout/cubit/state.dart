abstract class PeaStates{}
class PeaInitialState extends PeaStates{}

class ChangeBottomNavState extends PeaStates{}

class GetUserLoadingState extends PeaStates{}

class GetUserSuccessState extends PeaStates{}

class GetUserErrorState extends PeaStates{
  final String error;

  GetUserErrorState(this.error);
}
class OpenEmailLoadingState extends PeaStates{}

class OpenedEmailSuccess extends PeaStates{}

class OpenedEmailError extends PeaStates{}


class SignOutLoadingState extends PeaStates{}

class SignOutSuccessState extends PeaStates{}

class SignOutErrorState extends PeaStates{}

class CreateNarcissisticScoreLoading extends PeaStates{}

class CreateNarcissisticScoreSuccess extends PeaStates{}

class CreateNarcissisticScoreError extends PeaStates{}

class CreateSocialScoreLoading extends PeaStates{}

class CreateSocialScoreSuccess extends PeaStates{}

class CreateSocialScoreError extends PeaStates{}

class CreateSensitiveScoreLoading extends PeaStates{}

class CreateSensitiveScoreSuccess extends PeaStates{}

class CreateSensitiveScoreError extends PeaStates{}

class GetNarcResultLoading extends PeaStates{}

class GetNarcResultSuccess extends PeaStates{}

class GetSenResultLoading extends PeaStates{}

class GetSenResultSuccess extends PeaStates{}

class GetSocResultLoading extends PeaStates{}

class GetSocResultSuccess extends PeaStates{}

class ProfileImagePickedSuccessState extends PeaStates{}

class ProfileImagePickedErrorState extends PeaStates{}

class UserUpdateLoadingState extends PeaStates{}

class UploadProfileImageErrorState extends PeaStates{}

class UserUpdateErrorState extends PeaStates{}

class PeaProfileImagePickedSuccessState extends PeaStates{}

class PeaProfileImagePickedErrorState extends PeaStates{}

class PeaUploadProfileImageSuccessState extends PeaStates{}

class PeaUploadProfileImageErrorState extends PeaStates{}

class PeaUserUpdateLoadingState extends PeaStates{}

class PeaUserUpdateErrorState extends PeaStates{}

class GetAllUsersSuccessState extends PeaStates{}

class GetAllUsersErrorState extends PeaStates{
  final String error;

  GetAllUsersErrorState(this.error);

}

class SendMessageSuccessState extends PeaStates{}

class SendMessageErrorState extends PeaStates{}

class GetMessageSuccessState extends PeaStates{}

class GetMessageErrorState extends PeaStates{}
