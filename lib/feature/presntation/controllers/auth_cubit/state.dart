abstract class AuthState{}

class InitAuthState extends AuthState{}


class ChangeVisibilityPasswordState extends AuthState{}

class ChangeSelectRegisterState extends AuthState{}


class LoadingCreateNewUserState extends AuthState{}

class SuccessCreateNewUserState extends AuthState{}

class ErrorCreateNewUserState extends AuthState{}



class LoadingLoginUserState extends AuthState{}

class SuccessLoginUserState extends AuthState{}

class ErrorLoginUserState extends AuthState{}