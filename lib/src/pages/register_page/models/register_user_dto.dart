class RegisterUserDto {
  final String userName;
  final String password;

  const RegisterUserDto({required this.userName, required this.password});

  Map<String, dynamic> toJson() => {'userName': userName, 'password': password};
}
