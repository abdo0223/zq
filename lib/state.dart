abstract class SignUpStates{}

class SignUpInitialState extends SignUpStates{}

class SignUploadingState extends SignUpStates{}

class SignUpsuccessState extends SignUpStates{}

class SignUpErrorState extends SignUpStates{
  late final String error;
  SignUpErrorState (this.error);
}

class CreatrUserSuccessState extends SignUpStates{}

class CreatrUserErrorState extends SignUpStates{
  late final String error;
  CreatrUserErrorState (this.error);
}



